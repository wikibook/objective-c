//
//  RSSListTableDataSource.m
//  MyRSSReader
//

#import "RSSListTableDataSource.h"
#import "RSSParser.h"
#import "RSSEntry.h"

// 열명 식별자 
static NSString *
RSSListTableDataSourceDateColumnIdentifier = @"date";

static NSString *
RSSListTableDataSourceTitleColumnIdentifier = @"title";

static NSString *
RSSListTableDataSourceDescriptionColumnIdentifier = @"description";

// 리스트 아이템 소트용 메소드
// 날짜의 오름차순으로 소트하여 사용 
static NSInteger dateDescending(id item1, id item2, void *context)
{
    // 여기에서는 비교 대상이 반드시 'RSSListTableDataSource' 클래스의 
    // '_listItemsArray' 의 엘리먼트가 됨 
    // (그 이외의 장소에서 호출되지 않기 때문에)
    
    NSDate *date1 = [item1 date];
    NSDate *date2 = [item2 date];
    
    return [date2 compare:date1];
}

@implementation RSSListTableDataSource

- (id)init
{
    self = [super init];
    if (self)
    {
        _listItemsArray = nil;
    }
    return self;
}

- (void)dealloc
{
    [_listItemsArray release];
    _listItemsArray = nil;
    [super dealloc];
}

// 리스트 테이블의 아이템 수를 반환하는 메소드 
// 'NSTableViewDataSource' 프로토콜에 정의된 메소드 
- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return [_listItemsArray count];
}

// 리스트 테이블에 표시하는 오브젝트를 반환하는 메소드 
// 'NSTableViewDataSource' 프로토콜에 정의된 메소드 
- (id)tableView:(NSTableView *)aTableView
objectValueForTableColumn:(NSTableColumn *)aTableColumn
            row:(NSInteger)rowIndex
{
    id ret = nil;

    // 범위 체크를 한다 
    if (rowIndex < [_listItemsArray count])
    {
        // 열 식별자에 의해 반환되는 오브젝트를 변경 
        // 식별자는 'MainMenu.xib' 파일에서 설정 
        NSString *identifier = [aTableColumn identifier];
        RSSEntry *entry = [_listItemsArray objectAtIndex:rowIndex];
        
        if ([identifier isEqualToString:
             RSSListTableDataSourceDateColumnIdentifier])
        {
            // 일시
            // 문자열로 변환 
            NSDateFormatter *formatter;
            formatter = [[NSDateFormatter alloc] init];
            
            [formatter setDateStyle:NSDateFormatterShortStyle];
            [formatter setTimeStyle:NSDateFormatterShortStyle];
            ret = [formatter stringFromDate:[entry date]];
            [formatter release];
        }
        else if ([identifier isEqualToString:
                  RSSListTableDataSourceTitleColumnIdentifier])
        {
            // 타이틀 
            ret = [entry title];
        }
        else if ([identifier isEqualToString:
                  RSSListTableDataSourceDescriptionColumnIdentifier])
        {
            // 본문 
            ret = [entry text];
        }
    }
    return ret;
}

// URL 배열을 받아들여 '_listItemsArray'의 내용을 설정하는 메소드 
// 배열의 각 엘리먼트는 'NSURL' 클래스의 인스턴스가 됨 
- (void)reloadFromContentsOfURLsFromArray:(NSArray *)urlArray
{
    NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:0];
    
    for (NSURL *url in urlArray)
    {
        NSAutoreleasePool *pool;
        pool = [[NSAutoreleasePool alloc] init];
        
        // URL에서 읽어들임 
        NSArray *itemsArray;
        itemsArray = [self itemsArrayFromContentsOfURL:url];
        
        // 배열에 추가 
        [newArray addObjectsFromArray:itemsArray];
        
        [pool drain];
    }
    
    // 생성한 배열을 날짜를 키로하여 내림차순으로 소트 
    [newArray sortUsingFunction:dateDescending
                        context:NULL];
    
    // 데이터멤버로 설정 
    [_listItemsArray release];
    _listItemsArray = [newArray copy];
}

// URL에서 파일을 읽어들여 아이템 배열로 반환하는 메소드 
- (NSArray *)itemsArrayFromContentsOfURL:(NSURL *)url
{
    NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:0];
    RSSParser *parser = [[[RSSParser alloc] init] autorelease];
    
    // URL에서 읽어들임 
    if ([parser parseContentsOfURL:url])
    {
        // 기사를 읽어들임 
        [newArray addObjectsFromArray:[parser entries]];
    }
    
    return newArray;
}

// 기사의 URL을 취득 
- (NSURL *)urlAtIndex:(NSInteger)index
{
    NSURL *url = nil;
    
    // 범위체크 
    if (index < [_listItemsArray count])
    {
        url = [[_listItemsArray objectAtIndex:index] url];
    }
    return url;
}

@end
