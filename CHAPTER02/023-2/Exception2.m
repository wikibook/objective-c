#import <Foundation/Foundation.h>

@interface MyClass : NSObject
{
}
- (void)doThrow;
@end

@implementation MyClass

- (void)doThrow
{
    // 예외를 발생시킴
    [[NSException exceptionWithName:@"MyException"
                             reason:@"Not Implemented Method"
                           userInfo:nil] raise];
}

@end


int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    @try
    {
        MyClass *p = [[[MyClass alloc] init] autorelease];
        [p doThrow];
    }
    @catch (NSException *e)
    {
        // 예외를 처리하는 코드
        NSLog(@"Name    : %@", [e name]);
        NSLog(@"Reason  : %@", [e reason]);
        NSLog(@"UserInfo: %@", [[e userInfo] description]);
    }
    
    [pool drain];
    return 0;
}
