//
//  RSSListTableDataSource.m
//  MyRSSReader
//

#import "RSSListTableDataSource.h"
#import "RSSParser.h"
#import "RSSEntry.h"


// 리스트 아이템의 소트용 함수 
// 날짜의 내림차순으로 소트
static NSInteger dateDescending(id item1, id item2, void *context)
{
    // 여기에서는 비교 대상이 반드시 'RSSListTableDataSource' 클래스에 
    // '_listItemsArray' 의 엘리먼트가 됨 
    // (그 이외의 장소에서는 호출되지 않기 때문에) 
    
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
        _listItemArray = nil;
    }
    return self;
}

- (void)dealloc
{
    [_listItemArray release];
    _listItemArray = nil;
    [super dealloc];
}

// 리스트 테이블의 아이템 수를 반환하는 메소드 
// 'UITableViewDataSource' 프로토콜의 필수 메소드 
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [_listItemArray count];
}

// 리스트 테이블에 표시하는 셀을 반환하는 메소드 
// 'UITableViewDataSource' 프로토콜의 필수 메소드 
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    // 범위를 체크함 
    if (indexPath.row < [_listItemArray count])
    {
        // 셀을 생성 
        // 만약 재이용 가능한 셀이 있다면 그것을 사용 
        cell = [tableView dequeueReusableCellWithIdentifier:
                @"UITableViewCell"];
        if (!cell)
        {
            // 재이용 가능한 셀이 없기 때문에 신규로 생성 
            cell = [[[UITableViewCell alloc]
                     initWithStyle:UITableViewCellStyleSubtitle
                     reuseIdentifier:@"UITableViewCell"] autorelease];
        }
        
        // 문자열을 설정 
        cell.textLabel.text =
            [[_listItemArray objectAtIndex:indexPath.row] title];
        cell.detailTextLabel.text =
            [[_listItemArray objectAtIndex:indexPath.row] text];
    }
    
    return cell;
}

// URL의 배열을 받아들여 '_listItemsArray' 의 내용을 설정하는 메소드 
// 배열의 각 엘리먼트는 'NSURL' 클래스의 인스턴스로 만듬 
- (void)reloadFromContentsOfURLsFromArray:(NSArray *)urlsArray
{
    NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:0];
    
    for (NSURL *url in urlsArray)
    {
        NSAutoreleasePool *pool;
        pool = [[NSAutoreleasePool alloc] init];
        
        // URL에서 읽어들임 
        NSArray *itemsArray;
        itemsArray = [self itemsArrayFromContentsOfURL:url];
        
        // 배열을 추가 
        [newArray addObjectsFromArray:itemsArray];
                
        [pool drain];
    }
    
    // 생성한 배열에 날짜를 키로하여 내림차순으로 소트 
    [newArray sortUsingFunction:dateDescending
                        context:NULL];
    
    // 데이터 멤버로 설정 
    [_listItemArray release];
    _listItemArray = [newArray copy];
}

// URL에서 파일을 읽어들여 아이템 배열을 반환하는 메소드 
- (NSArray *)itemsArrayFromContentsOfURL:(NSURL *)url
{
    NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:0];
    RSSParser *parser = [[[RSSParser alloc] init] autorelease];
    
    // URL에서 읽어들임 
    if ([parser parseContentsOfURL:url])
    {
        // 게시물을 읽어들임 
        [newArray addObjectsFromArray:[parser entries]];
    }
    
    return newArray;
}

// 게시물의 URL을 취득 
- (NSURL *)urlAtIndex:(NSInteger)index
{
    NSURL *url = nil;
    
    // 범위 체크 
    if (index < [_listItemArray count])
    {
        url = [[_listItemArray objectAtIndex:index] url];
    }
    return url;
}

@end
