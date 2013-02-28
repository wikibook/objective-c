//
//  RSSListView.m
//  MyRSSReader
//

#import "RSSListView.h"
#import "RSSListTableDataSource.h"
#import "AppDelegate.h"

@implementation RSSListView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"RSS", @"RSS");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Release any cached data, images, etc that aren't in use.
//}

//#pragma mark - View lifecycle

// 뷰의 초기화 처리를 구현한다
- (void)viewDidLoad
{
    // 데이터소스를 생성한다
    _tableDataSource = [[RSSListTableDataSource alloc] init];
    
    // 테이블에 설정한다 
    [_tableView setDataSource:_tableDataSource];
}

//- (void)viewDidUnload
////{
//    [super viewDidUnload];
////    // Release any retained subviews of the main view.
//    // e.g. self.myOutlet = nil;
//}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//


// 뷰가 표시되었을 때의 처리 
- (void)viewDidAppear:(BOOL)animated
{
    // URL 배열을 생성 
    NSUserDefaults *userDefaults;
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    // 유저 디폴트에서 URL 문자열의 배열을 취득
    NSArray *urlStrArray;
    urlStrArray = 
    [userDefaults stringArrayForKey:RSSReaderURLStringArray];
    
    // URL의 문자열에서 'NSURL' 클래스의 인스턴스 배열을 생성
    NSMutableArray *urlArray;
    urlArray = [NSMutableArray arrayWithCapacity:0];
    
    for (NSString *str in urlStrArray)
    {
        NSURL *url = [NSURL URLWithString:str];
        
        if (url) {
            [urlArray addObject:url];
        }
    }
    
    // RSS파일을 읽어들임
    [_tableDataSource reloadFromContentsOfURLsFromArray:urlArray];
    
    // 테이블 갱신
    [_tableView reloadData];
    
}


// 선택한 항목을 오픈
- (IBAction)openSelection:(id)sender
{
    // 선택한 항목을 취득한다 
    NSIndexPath *indexPath;
    indexPath = [_tableView indexPathForSelectedRow];
    
    if(!indexPath)
        return; // 아무것도 선택되지 않음
    
    // 데이터소스에서 URL을 취득한다
    NSURL *url = [_tableDataSource urlAtIndex:indexPath.row];    
    // URL을 오픈
    [[UIApplication sharedApplication] openURL:url];

}

// 소멸처리 
- (void)dealloc
{
    [_tableView setDataSource:nil];
    [_tableDataSource release];
    _tableDataSource = nil;
    [super dealloc];
}
 
 
@end
