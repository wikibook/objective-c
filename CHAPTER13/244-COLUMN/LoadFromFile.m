#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 사용자 디폴트를 취득
    NSUserDefaults *userDefaults;
    
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    // 파일에서 사전을 읽어옴
    NSData *data = [NSData dataWithContentsOfFile:@"/setting.plist"];
    NSPropertyListFormat format;
    NSString *errStr;
    
    id dict = [NSPropertyListSerialization propertyListFromData:data
                           mutabilityOption:NSPropertyListImmutable
                                     format:&format
                           errorDescription:&errStr];
    [errStr release];
    
    // 읽어온 사전을 사용해 설정값을 설정
    // 단 시스템이 설정한 것도 포함되어 있으므로 
    // 취득할 값을 제한
    NSArray *keys = [NSArray arrayWithObjects:
                     @"firstValue", @"secondValue", nil];
    
    for (NSString *key in keys)
    {
        // 지정한 값이 없을 수도 있으므로 있는지 없는지 검사
        if ([dict objectForKey:key])
        {
            [userDefaults setObject:[dict objectForKey:key]
                             forKey:key];
        }
    }
        
    // 파일에 즉시 반영
    [userDefaults synchronize];    
    
    [pool drain];
    return 0;
}