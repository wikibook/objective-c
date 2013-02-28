#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 사용자 디폴트를 취득
    NSUserDefaults *userDefaults;
    
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    // 설정값을 두 개 저장
    [userDefaults setInteger:5
                      forKey:@"firstValue"];
    [userDefaults setInteger:10
                      forKey:@"secondValue"];

    // 설정값을 전부 취득
    NSDictionary *dict = [userDefaults dictionaryRepresentation];
    
    // 파일에 기록
    // 아래 경로는 알맞게 변경해주세요
    [dict writeToFile:@"/Users/gaheeyoon/setting.plist"
           atomically:YES];
    
    [pool drain];
    return 0;
}