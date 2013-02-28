#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 사용자디폴트를 취득 
    NSUserDefaults *userDefaults;
    
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    // 설정값을 저장
    // 여기에서는 ‘키’를 ‘setttingValue’ 
    // 값을 ‘5’로 저장
    [userDefaults setInteger:5
                      forKey:@"settingValue"];
    
    // 파일에 즉시 반영
    [userDefaults synchronize];
    
    [pool drain];
    return 0;
}
