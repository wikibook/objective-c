//
//  PrefWindowController.m
//  MyRSSReader
//

#import "PrefWindowController.h"
#import "AppDelegate.h"

@implementation PrefWindowController

- (id)init
{
    // 'PrefWindow.nib' 파일을 읽어들여 초기화 
    self = [super initWithWindowNibName:@"PrefWindow"];
    if (self)
    {
    }
    return self;
}

// 'nib' 파일이 로드되었을 때 호출되는 메소드 
- (void)windowDidLoad
{
    // 윈도우를 중앙으로 이동시킴 
    [[self window] center];
}

// URL의 테이블뷰에 표시되는 항목 수를 반환하는 메소드 
// 'NSTableViewDataSource' 프로토콜에 정의된 메소드 
- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    // 사용자 디폴트에서 배열을 취득 
    NSUserDefaults *userDefaults;
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *strArray;
    strArray = [userDefaults stringArrayForKey:
                RSSReaderURLStringArray];
    
    // 엘리먼트 수를 반환 
    return [strArray count];
}

// URL의 테이블뷰에 표시되는 오브젝트를 반환 
// 여기에서는 URL문자열을 반환 
// 'NSTableViewDataSource' 프로토콜에 정의된 메소드 
- (id)tableView:(NSTableView *)aTableView
objectValueForTableColumn:(NSTableColumn *)aTableColumn
            row:(NSInteger)rowIndex
{
    id ret = nil;
    
    // 사용자 디폴트에서 배열을 생성 
    NSUserDefaults *userDefaults;
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *strArray;
    strArray = [userDefaults stringArrayForKey:
                RSSReaderURLStringArray];
    
    // 범위 체크 
    if (rowIndex < [strArray count])
    {
        ret = [strArray objectAtIndex:rowIndex];
    }
    
    return ret;
}

// 테이블뷰 내에 변경이 있을 경우 호출되는 메소드 
// 여기에서는 사용자 디폴트를 갱신하고 다시 읽어들이도록 통지 
// 'NSTableViewDataSource' 프로토콜에 정의된 메소드 
- (void)tableView:(NSTableView *)aTableView
   setObjectValue:(id)anObject
   forTableColumn:(NSTableColumn *)aTableColumn
              row:(NSInteger)rowIndex
{
    // 사용자 디폴트에서 배열을 생성 
    // 여기에서는 내용을 변경하기 때문에 가변 배열을 생성 
    NSUserDefaults *userDefaults;
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *strArray;
    strArray = [NSMutableArray arrayWithArray:
                [userDefaults stringArrayForKey:
                 RSSReaderURLStringArray]];
    
    // 범위체크 
    if (rowIndex < [strArray count])
    {
        // 새로운 값으로 변경
        [strArray replaceObjectAtIndex:rowIndex
                            withObject:anObject];
        
        // 사용자 디폴트에 저장
        [userDefaults setObject:strArray
                         forKey:RSSReaderURLStringArray];
        
        // 변경된 것을 통지 
        // 'AppDelegate' 에서 이 통지를 받아들임 
        // 다시 읽어들임 
        NSNotificationCenter *center;
        
        center = [NSNotificationCenter defaultCenter];
        [center postNotificationName:RSSReaderReloadNotification
                              object:self];        
    }
}

// URL을 추가하는 액션 
- (IBAction)addURL:(id)sender
{
    // 사용자 디폴트로부터 배열을 생성 
    NSUserDefaults *userDefaults;
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *strArray;
    strArray = [userDefaults stringArrayForKey:
                RSSReaderURLStringArray];
    
    // 중복을 방지하기 위해 세트를 생성 
    // 여기에서는 값의 추가를 위해 가변 세트를 생성 
    NSMutableSet *strSet;
    strSet = [NSMutableSet setWithArray:strArray];
    
    // 텍스트필드에서 입력된 문자열을 취득 
    NSString *str;
    str = [_textField stringValue];
    
    // 세트에 추가
    // 사용자 디폴트에는 문자열로 저장 
    [strSet addObject:str];
    
    // 저장을 위한 배열을 취득 
    strArray = [strSet allObjects];
    
    // 사용자 디폴트에 저장 
    [userDefaults setObject:strArray
                     forKey:RSSReaderURLStringArray];
    
    // 테이블을 갱신 
    [_tableView reloadData];
    
    // 변경되었음을 통지 
    // 'AppDelegate'에서 이 통지를 받아들여 다시 읽어들임 
    NSNotificationCenter *center;

    center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:RSSReaderReloadNotification
                          object:self];
}

// URL을 삭제하는 액션 
- (IBAction)removeURL:(id)sender
{
    // 선택된 항목을 취득 
    NSInteger row = [_tableView selectedRow];
    
    // 아무것도 선택되지 않은 경우에는 'NSNotFound'가 반환됨 
    if (row == NSNotFound)
        return;
    
    // 사용자 디폴트에서 배열을 생성 
    // 여기에서는 값의 삭제를 위해 가변 배열을 취득 
    NSUserDefaults *userDefaults;
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *strArray;
    strArray = [NSMutableArray arrayWithArray:
                [userDefaults stringArrayForKey:
                 RSSReaderURLStringArray]];
    
    // 이 배열의 순서와 표시의 순서가 일치하기 때문에 
    // 이대로 'row'의 위치를 삭제함으로써 처리가 가능
    // 그렇지 않은 경우에는 내용을 지정해서 삭제하도록 
    // 변경하면 됨 
    [strArray removeObjectAtIndex:row];
    
    // 새로운 배열을 사용자 디폴트에 저장 
    [userDefaults setObject:strArray
                     forKey:RSSReaderURLStringArray];
    
    // 테이블을 갱신 
    [_tableView reloadData];

    // 변경되었음을 통지 
    // 'AppDelegate'에서 이 통지를 받아들여 다시 읽어들임 
    NSNotificationCenter *center;
    
    center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:RSSReaderReloadNotification
                          object:self];
}

@end
