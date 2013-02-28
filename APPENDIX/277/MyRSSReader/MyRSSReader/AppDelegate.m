//
//  AppDelegate.m
//  MyRSSReader
//

#import "AppDelegate.h"
#import "RSSListTableDataSource.h"
#import "PrefWindowController.h"

// URL 배열을 저장할 사용자 디폴트 키 
NSString *RSSReaderURLStringArray = @"RSSReaderURLStringArray";

// 다시 읽어들임 통지 
NSString *RSSReaderReloadNotification =
@"RSSReaderReloadNotification";

@implementation AppDelegate
@synthesize window;

// 인스턴스의 초기화 
- (id)init
{
    self = [super init];
    if (self)
    {
        _dataSource = nil;
        _prefWindowController = nil;
    }
    return self;
}

- (void)dealloc
{
    // 통지센터에서 삭제 
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    // 테이블뷰의 타겟을 해제 
    [_tableView setTarget:nil];
    
    // 해제처리 
    [_dataSource release];
    _dataSource = nil;
    [_prefWindowController release];
    _prefWindowController = nil;
    
    [super dealloc];
}

// 애플리케이션의 초기화 처리 
// 'NSApplicationDelegate' 프로토콜에 정의된 메소드 
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // 윈도우를 중앙으로 이동 
    [window center];
    
	// 테이블뷰의 데이터소스를 생성 
    _dataSource = [[RSSListTableDataSource alloc] init];
    
    // 테이블에 설정 
    [_tableView setDataSource:_dataSource];
    
    // 테이블을 더블클릭 했을때의 메소드를 설정 
    [_tableView setDoubleAction:@selector(openSelection:)];
    [_tableView setTarget:self];
    
    // 통지센터에 등록
    NSNotificationCenter *center;
    center = [NSNotificationCenter defaultCenter];
    
    // 다시 읽어들임 통지를 받아들임 
    [center addObserver:self
               selector:@selector(reloadNotification:)
                   name:RSSReaderReloadNotification
                 object:nil];
    
    // 윈도우가 닫혔을때의 통지를 받아들임 
    // 환경설정 윈도우가 닫혔을 때를 위해 등록 
    [center addObserver:self
               selector:@selector(windowWillCloseNotification:)
                   name:NSWindowWillCloseNotification
                 object:nil];
    
    // 다시 읽어들임 
    [self reloadNotification:nil];
}

// 다시 읽어들임 통지에 대응하기 위한 메소드 
- (void)reloadNotification:(NSNotification *)aNotification
{
    // 사용자 디폴트에서 URL의 배열을 취득 
    // 사용자 디폴트에는 문자열 배열로 저장되기 때문에 
    // 여기에서도 문자열 배열에서 'NSURL' 클래스의 인스턴스 
    // 배열을 생성 
    NSUserDefaults *userDefaults;
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *strArray;
    strArray =
    [userDefaults stringArrayForKey:RSSReaderURLStringArray];
    
    NSMutableArray *urlArray;
    urlArray = [NSMutableArray arrayWithCapacity:0];
    
    for (NSString *str in strArray)
    {
        NSURL *url = [NSURL URLWithString:str];
        
        if (url)
        {
            [urlArray addObject:url];
        }
    }
    
    // RSS파일을 읽어들임 
    [_dataSource reloadFromContentsOfURLsFromArray:urlArray];
    
    // 테이블 갱신 
    [_tableView reloadData];
}

// 윈도우가 닫히기 직전의 통지에 대응하는 메소드 
- (void)windowWillCloseNotification:(NSNotification *)aNotification
{
    // 통지를 날린 오브젝트를 취득하고 만약 환경설정 윈도우라면 
    // 멤버 변수를 클리어 
    id sender = [aNotification object];
    
    if (sender == _prefWindowController)
    {
        // 환경설정 윈도우 
        // 즉시 해제하지 않고 자동해제에 맡김으로써 
        // 일련의 해제처리 사이에 해제되지 않도록 함 
        [_prefWindowController autorelease];
        _prefWindowController = nil;
    }
}

// 더블클릭 했을때의 메소드 
- (IBAction)openSelection:(id)sender
{
    // 테이블뷰에서 더블클릭 한 행을 취득 
    NSInteger clickedRow = [_tableView clickedRow];
    
    // 더블클릭 된 게시물의 URL을 취득 
    if (clickedRow != NSNotFound)
    {
        NSURL *url = [_dataSource urlAtIndex:clickedRow];
        
        // URL을 오픈 
        [[NSWorkspace sharedWorkspace] openURL:url];
    }
}

// 환경설정 윈도우를 표시하는 메소드 
- (IBAction)openPreferenceWindow:(id)sender
{
    // 윈도우가 이미 있는지 체크 
    if (!_prefWindowController)
    {
        // 없으면 신규로 생성 
        _prefWindowController = [[PrefWindowController alloc] init];
    }
    
    // 표시 
    [_prefWindowController showWindow:sender];
}

@end
