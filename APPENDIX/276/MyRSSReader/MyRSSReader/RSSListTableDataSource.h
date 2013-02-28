//
//  RSSListTableDataSource.h
//  MyRSSReader
//

#import <Foundation/Foundation.h>

@interface RSSListTableDataSource : NSObject <UITableViewDataSource>
{
    // 리스트에 표시할 아이템을 저장할 배열 
    // 각 엘리먼트는 'RSSEntry' 클래스의 인스턴스가 됨 
    
    NSArray *_listItemArray;
}

- (void)reloadFromContentsOfURSsFromArray:(NSArray *)urlsArray;
- (NSArray *)itemsArrayFromContentsOfURL:(NSURL *)url;
- (NSURL *)urlAtIndex:(NSInteger)index;

@end
