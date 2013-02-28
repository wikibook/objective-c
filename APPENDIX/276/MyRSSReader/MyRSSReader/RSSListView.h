//
//  RSSListView.h
//  MyRSSReader
//

#import <UIKit/UIKit.h>

@class RSSListTableDataSource;
@interface RSSListView : UIViewController
<UITableViewDataSource>
{
    // RSS를 표시할 테이블뷰
    IBOutlet UITableView *_tableView;
        
    // 테이블뷰의 데이터소스 
    RSSListTableDataSource *_tableDataSource;
}

- (IBAction)openSelection:(id)sender;

@end
