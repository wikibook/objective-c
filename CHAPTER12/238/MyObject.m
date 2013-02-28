#import "MyObject.h"

@implementation MyObject

- (void)post
{
    // 통지
    // 통지센터를 취득    
    NSNotificationCenter *center;
    
    center = [NSNotificationCenter defaultCenter];
    
    // 추가정보에 문자열을 넣어둠
    NSDictionary *dict;
    
    dict = [NSDictionary dictionaryWithObject:@"Notification"
                                       forKey:@"String"];
    
    // ‘MyNotification’을 통지
    [center postNotificationName:@"MyNotification"
                          object:self
                        userInfo:dict];
}

@end
