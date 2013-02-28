#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 사용자 디폴트를 취득
    NSUserDefaults *userDefaults;
    
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    // 디폴트 값을 설정하기 위해 사전을 생성
    NSDictionary *dict;
    
    dict = [NSDictionary dictionaryWithObjectsAndKeys:
            [NSNumber numberWithInteger:5], @"firstValue", nil];
    
    // 사용자 디폴트에 초기값으로 설정
    [userDefaults registerDefaults:dict];
    
    // 설정값을 읽어옴
    // 초기값이 설정됐으므로 초기값이 사용됨
    NSInteger i = [userDefaults integerForKey:@"firstValue"];
    
    NSLog(@"%ld", (long)i);
    
    // 초기값이 설정되어 있지 않을 때는 ‘0’이 됨
    i = [userDefaults integerForKey:@"secondValue"];

    NSLog(@"%ld", (long)i);
    
    [pool drain];
    return 0;
}
