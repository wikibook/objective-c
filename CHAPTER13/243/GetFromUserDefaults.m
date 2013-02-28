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
    
    // 설정값을 취득
    // 여기에서는 ‘secondValue’ 의 값을 취득
    NSNumber *value = [userDefaults objectForKey:@"secondValue"];
    
    NSLog(@"%@", value);
    
    [pool drain];
    return 0;
}