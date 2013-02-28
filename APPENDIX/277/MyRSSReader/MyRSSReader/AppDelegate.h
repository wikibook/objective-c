//
//  AppDelegate.h
//  MyRSSReader
//

#import <Cocoa/Cocoa.h>

// URL 배열을 저장할 사용자 디폴트의 키 
extern NSString *RSSReaderURLStringArray;

// 다시 읽어들이도록 통지 
extern NSString *RSSReaderReloadNotification;

@class RSSListTableDataSource;
@class PrefWindowController;
@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    NSWindow                *window;
    
    // 게시물을 표시할 테이블뷰 
    IBOutlet NSTableView    *_tableView;
    
    // 게시물을 표시할 테이블뷰의 데이터소스 
    RSSListTableDataSource  *_dataSource;
    
    // 환경설정 윈도우의 윈도우컨트롤러 
    // 환경설정 윈도우는 항상 하나만 표시되기 때문에 멤버변수로 가짐 
    PrefWindowController    *_prefWindowController;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)openSelection:(id)sender;
- (IBAction)openPreferenceWindow:(id)sender;
- (void)reloadNotification:(NSNotification *)aNotification;

@end