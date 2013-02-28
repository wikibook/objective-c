//
//  SecondViewController.m
//  MyRSSReader
//

#import "PrefView.h"
#import "AppDelegate.h"

@implementation PrefView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"설정", @"설정");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

// URL의 테이블뷰에 표시하는 항목수를 반환하는 메소드 
// 'UITableViewDataSource' 프로토콜의 필수 메소드 
- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section
{
    // 사용자 디폴트에서 배열을 취득함
    NSUserDefaults *userDefaults;
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *urlsArray;
    urlsArray = [userDefaults stringArrayForKey:RSSReaderURLStringArray];
    
    // 엘리먼트 수를 반환 
    return [urlsArray count];
}

							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

// URL의 테이블뷰에 표시할 셀을 반환
// 여기에서는 URL을 문자열로 표시할 셀을 반환 
// 'UITableViewDataSource' 프로토콜의 필수 메소드 
- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    // 사용자 디폴트에서 배열을 생성
    NSUserDefaults *userDefault;
    userDefault = [NSUserDefaults standardUserDefaults];
    
    NSArray *urlsArray;
    urlsArray = [userDefault stringArrayForKey:RSSReaderURLStringArray];
    
    // 인덱스경로에서 행번호를 취득하고, 배열의 엘리먼트수보다 작은지 체크
    if (indexPath.row < [urlsArray count])
    {
        // 셀을 생성
        // 만약 재이용 가능한 셀이 있으면, 그것을 사용
        cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        
        if(!cell)
        {
            //재이용 가능한 셀이 없으므로 신규로 생성
            cell = [[[UITableViewCell alloc]
                     initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"] autorelease];
        }
        
        // 문자열을 설정
        cell.textLabel.text = [urlsArray objectAtIndex:indexPath.row];
    }    
        
    return cell;
}

// URL을 추가하는 액션 
- (IBAction)addURL:(id)sender
{
    // 편집을 종료할 키보드를 숨김 
    [_textField resignFirstResponder];
    
    // 유저 디폴트에서 배열을 생성 
    NSUserDefaults *userDefaults;
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *urlsArray;
    urlsArray = [userDefaults stringArrayForKey:RSSReaderURLStringArray];
    
    // 중복을 막기 위해, 세트를 생성
    // 여기에서는 추가를 하기 때문에 변경 가능한 세트를 생성
    NSMutableSet *urlsSet;
    urlsSet = [NSMutableSet setWithArray:urlsArray];
    
    // 텍스트필드에서 입력된 문자열을 취득 
    NSString *str;
    str = [_textField text];
    
    // 세트에 추가
    // 유저 디폴트에는 문자열로 보존
    [urlsSet addObject:str];
    
    // 저장을 위한 배열을 취득 
    urlsArray = [urlsSet allObjects];
    
    // 사용자 디폴트에 보존 
    [userDefaults setObject:urlsArray forKey:RSSReaderURLStringArray];
    
    // 테이블을 갱신
    [_tableView reloadData];
}

// URL을 삭제할 액션 
- (IBAction)removeURL:(id)sender
{
    // 편집을 종료할 키보드를 숨김 
    [_textField resignFirstResponder];
    
    // 선택된 항목을 취득 
    NSIndexPath *indexPath;
    indexPath = [_tableView indexPathForSelectedRow];
    
    if(!indexPath)
        return; // 선택되지 않은 경우 
    
    // 사용자 디폴트에서 배열을 생성 
    // 여기에서는 값의 삭제를 위해 가변 배열을 취득 
    NSUserDefaults *userDefaults;
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *urlsArray;
    urlsArray = [NSMutableArray arrayWithArray:[userDefaults stringArrayForKey:RSSReaderURLStringArray]];
    
    // 이 배열의 순서와 표시의 순서가 일치하기 때문에 
    // 이대로 'indexPath'의 'row' 프로퍼티의 위치를 삭제함으로써 처리 가능
    // 그렇지 않은 경우에는 내용을 지정해서 삭제하도록 변경해야 함
    [urlsArray removeObjectAtIndex:indexPath.row];
    
    // 새로운 배열을 사용자 디폴트에 저장 
    [userDefaults setObject:urlsArray forKey:RSSReaderURLStringArray];
    
    // 테이블을 갱신 
    [_tableView reloadData];
}


@end
