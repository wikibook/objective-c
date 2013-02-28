//
//  PrefWindowController.h
//  MyRSSReader
//

#import <Foundation/Foundation.h>

// '환경설정'윈도우의 윈도우컨트롤러클래스와  
// URL 리스트를 표시하는 테이블뷰의 데이터소스 기능을 겸용 
@interface PrefWindowController : NSWindowController
{
    // URL 리스트를 표시하는 테이블뷰 
    IBOutlet NSTableView    *_tableView;
    
    // 신규 URL을 입력하는 텍스트 편집 필드 
    IBOutlet NSTextField    *_textField;
}

// URL을 추가할 액션 
- (IBAction)addURL:(id)sender;

// URL을 삭제할 액션 
- (IBAction)removeURL:(id)sender;

@end
