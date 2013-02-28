//
//  RSSParser.m
//  MyRSSReader
//

#import "RSSParser.h"
#import "RSSEntry.h"

@implementation RSSParser
@synthesize entries = _entries;

- (id)init
{
    self = [super init];
    if (self)
    {
        _entries = nil;
        _elementStack = [[NSMutableArray alloc] init];
        _curEntry = nil;
    }
    return self;
}

- (void)dealloc
{
    [_elementStack release];
    _elementStack = nil;
    [_entries release];
    _entries = nil;
    [super dealloc];
}

// URL로부터 RSS파일을 읽어들임 
// 여기에서는 RSS 2.0만 대응 
- (BOOL)parseContentsOfURL:(NSURL *)url
{
    BOOL ret = NO;
    
    // XML 파서의 준비 
    NSXMLParser *parser;
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    
    [parser setDelegate:self];
    
    // 엔트리를 넣을 배열을 클리어
    [_entries release];
    _entries = [[NSMutableArray alloc] init];
    
    // 분석 시작 
    if ([parser parse])
    {
        // 아이템이 하나라도 취득되었다면 성공
        if ([[self entries] count] > 0)
            ret = YES;
    }
    
    // 중간 데이터를 삭제 
    [_elementStack removeAllObjects];
    [_curEntry release];
    _curEntry = nil;
    
    [parser release];
    return ret;
}

// 엘리먼트 개시시의 처리 
- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict
{
    // 엘리먼트 위치를 파악하기 위해 스택에 엘리먼트 명을 추가 
    [_elementStack addObject:elementName];
}

// 엘리먼트 종료시의 처리 
- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
    // 엘리먼트 위치를 파악하기 위해 스택에서 엘리먼트명을 삭제 
    [_elementStack removeLastObject];
    
    // 종료한 엘리먼트명이 'item'에서 현재 분석중인 엔트리가 
    // 있는 경우에는 배열 '_entries'에 추가하여 해제
    if ([elementName isEqualToString:@"item"] &&
        _curEntry)
    {
        [_entries addObject:_curEntry];
        [_curEntry release];
        _curEntry = nil;
    }
}

// 엘리먼트 스택을 파일 패스와 같은 문자열로 변환 
- (NSString *)elementPath
{
    NSMutableString *path = [NSMutableString stringWithCapacity:0];
    
    for (NSString *str in _elementStack)
    {
        [path appendFormat:@"/%@", str];
    }

    return path;
}

// 현재 분석중인 엔트리를 반환 
- (RSSEntry *)currentEntry
{
    if (!_curEntry)
    {
        // 아직 해석중인 엔트리가 없으므로 새롭게 생성 
        _curEntry = [[RSSEntry alloc] init];
    }
    return _curEntry;
}

// 문자열이 발견되었을 경우에 호출됨 
- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string
{
    // 엘리먼트 위치에 따라 텍스트 노드의 의미가 다름 
    // 위치의 판정을 쉽게 하기 위해 파일 패스와 같은
    // 문자열로 함 
    NSString *str = [self elementPath];

    // 생성한 문자열을 사용하여 판정 
    if ([str isEqualToString:
         @"/rss/channel/item/title"])
    {
        // 게시물의 타이틀 
        NSString *str = [[self currentEntry] title];
        
        if (str)
            str = [str stringByAppendingString:string];
        else
            str = string;
        
        [[self currentEntry] setTitle:str];
    }
    else if ([str isEqualToString:
              @"/rss/channel/item/link"])
    {
        // 게시물의 주소  
        NSURL *url = [NSURL URLWithString:string];
        [[self currentEntry] setUrl:url];
    }
    else if ([str isEqualToString:
              @"/rss/channel/item/pubDate"])
    {
        // 게시물의 일시 
        NSDate *date = [self pubDateWithString:string];
        [[self currentEntry] setDate:date];
    }
    else if ([str isEqualToString:
              @"/rss/channel/item/description"])
    {
        // 게시물의 본문
        NSString *str = [[self currentEntry] text];
        
        if (str)
            str = [str stringByAppendingString:string];
        else
            str = string;
        
        [[self currentEntry] setText:str];
    }
}

// RSS 2.0의 표기방법으로 쓰여진 일시에서 오브젝트를 취득 
- (NSDate *)pubDateWithString:(NSString *)string
{
    NSDate *date = nil;
    
    // 스페이스를 토큰으로 문자열을 분할 
    NSArray *tokens = [string componentsSeparatedByString:@" "];
    
    // 나뉘어진 문자열로부터 일시 정보를 구축 
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    // 최소한 4가지를 필요로 함 (요일, 일, 월, 년) s
    if ([tokens count] >= 4)
    {
        // 타임존 
        NSTimeZone *tz = [NSTimeZone localTimeZone];
        
        // 일
        [comps setDay:[[tokens objectAtIndex:1] integerValue]];
        
        // 년
        [comps setYear:[[tokens objectAtIndex:3] integerValue]];
        
        // 월을 문자열에서 변환하기 때문에 배열로 생성
        NSArray *monthNames = [NSArray arrayWithObjects:
                               @"Jan", @"Feb", @"Mar", @"Apr",
                               @"May", @"Jun", @"Jul", @"Aug",
                               @"Sep", @"Oct", @"Nov", @"Dec",
                               nil];
        NSUInteger month = [monthNames indexOfObject:
                            [tokens objectAtIndex:2]];
        if (month != NSNotFound)
        {
            // 인덱스 번호는 0부터 시작하기 때문에 1을 더함 
            [comps setMonth:month + 1];
            
            // 시간은 ':' 을 토큰으로 하여 구분 
            if ([tokens count] > 4)
            {
                NSArray *timeTokens =
                [[tokens objectAtIndex:4]
                 componentsSeparatedByString:@":"];
                
                // 시간을 읽어들임 
                if ([timeTokens count] > 0)
                {
                    [comps setHour:
                     [[timeTokens objectAtIndex:0] integerValue]];
                }
                
                // 분을 읽어들임 
                if ([timeTokens count] > 1)
                {
                    [comps setMinute:
                     [[timeTokens objectAtIndex:1] integerValue]];
                }
                
                // 초를 읽어들임 
                if ([timeTokens count] > 2)
                {
                    [comps setSecond:
                     [[timeTokens objectAtIndex:2] integerValue]];
                }
                
                // 타임존을 읽어들임 
                if ([tokens count] > 5)
                {
                    NSString *timezoneStr =
                    [tokens objectAtIndex:5];
                    
                    if ([timezoneStr length] >= 4)
                    {
                        // 뒤의 4문자는 옵셋값 
                        // 그 앞은 부호 
                        NSString *hOffset =
                            [timezoneStr substringWithRange:
                             NSMakeRange([timezoneStr length]-4, 2)];
                        NSString *mOffset =
                            [timezoneStr substringFromIndex:
                             [timezoneStr length] - 2];
                        NSInteger sign = 1;
                        
                        // 부호가 붙어있다면 부호를 확인 
                        if ([timezoneStr length] > 4)
                        {
                            unichar uc;
                            uc = [timezoneStr characterAtIndex:
                                  [timezoneStr length] - 5];
                            
                            if (uc == L'-')
                                sign = -1;
                        }
                        
                        // 읽어들인 문자열에서 옵셋 초를 계산 
                        NSInteger offsetSecond =
                            [hOffset integerValue] * 3600 +
                            [mOffset integerValue] * 60;
                        offsetSecond *= sign;
                        
                        // 타임존을 취득 
                        tz = [NSTimeZone timeZoneForSecondsFromGMT:
                              offsetSecond];
                    }
                }
            }
            
            // 날짜를 취득 
            NSCalendar *calendar;
            calendar = [[[NSCalendar alloc]
                initWithCalendarIdentifier:NSGregorianCalendar]
                autorelease];  
            [calendar setTimeZone:tz];
            
            date = [calendar dateFromComponents:comps];
        }
    }
    
    [comps release];
    return date;
}

@end
