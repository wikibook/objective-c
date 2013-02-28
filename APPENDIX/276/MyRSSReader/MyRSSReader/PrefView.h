//
//  SecondViewController.h
//  MyRSSReader
//


#import <UIKit/UIKit.h>


// URL 리스트를 표시하는 테이블뷰의 데이터소스와 
// 설정표시용 뷰의 뷰컨트롤러를 겸용함 
@interface PrefView : UIViewController
<UITableViewDataSource>
{
    // URL의 리스트를 표시하는 테이블뷰
    IBOutlet UITableView *_tableView;
    
    // 신규 URL을 입력할 텍스트 편집 필드 
    IBOutlet UITextField *_textField;
}

// URL을 추가하는 액션 
- (IBAction)addURL:(id)sender;

// URL을 삭제하는 액션 
- (IBAction)removeURL:(id)sender;

@end


