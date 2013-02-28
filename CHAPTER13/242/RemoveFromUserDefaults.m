#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 사용자 디폴트 취득
    NSUserDefaults *userDefaults;
    
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    // 설정값을 두 개 저장
    [userDefaults setInteger:5
                      forKey:@"firstValue"];
    [userDefaults setInteger:10
                      forKey:@"secondValue"];
    
    // 설정값 중 한 개를 삭제
    // 여기에서는 ‘firstValue’를 삭제
    [userDefaults removeObjectForKey:@"firstValue"];
    
    // 파일에 즉시 반영
    [userDefaults synchronize];
    
    [pool drain];
    return 0;
}