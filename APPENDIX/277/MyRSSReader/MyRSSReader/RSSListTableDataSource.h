//
//  RSSListTableDataSource.h
//  MyRSSReader
//

#import <Foundation/Foundation.h>


@interface RSSListTableDataSource : NSObject <NSTableViewDataSource>
{
    // 리스트에 표시되는 아이템을 저장할 배열 
    // 각 엘리먼트는 'RSSEntry' 클래스의 인스턴스로 함
    NSArray *_listItemsArray;
}

- (void)reloadFromContentsOfURLsFromArray:(NSArray *)urlArray;
- (NSArray *)itemsArrayFromContentsOfURL:(NSURL *)url;
- (NSURL *)urlAtIndex:(NSInteger)index;

@end
