#import "MyObject.h"

@implementation MyObject

- (void)post
{
    // 통지
    // 통지센터를 취득
    NSNotificationCenter *center;
    
    center = [NSNotificationCenter defaultCenter];
    
    // ‘MyNotification’을 통지
    [center postNotificationName:@"MyNotification"
                          object:self
                        userInfo:nil];
}

@end
