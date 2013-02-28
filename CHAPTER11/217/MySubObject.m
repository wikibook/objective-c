#import "MySubObject.h"

@implementation MySubObject

- (void)checkMethod
{
    // 부모클래스에 메서드가 있는지 확인
    // 여기에서는 ‘checkMethod’ 메서드와 ‘retain’ 메서드가 있는지 확인
    BOOL b;
    b = [[self superclass] instancesRespondToSelector:
         @selector(checkMethod)];
    
    NSLog(@"checkMethod : %d", b);
    
    b = [[self superclass] instancesRespondToSelector:
         @selector(retain)];
    
    NSLog(@"retain      : %d", b);
}

@end
