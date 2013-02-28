#import "MyThreadObject.h"

@implementation MyThreadObject

// 별도의 쓰레드로 실행할 메서드
- (void)threadProc:(id)anArgument
{
    // 별도의 쓰레드 용 자동소멸 풀
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSLog(@"Start");
    
    // 파라미터의 값을 조사
    if ([anArgument boolValue])
    {
        // 이 메서드를 실행 중인 현재의 쓰레드를 중단
        [pool release];
        [NSThread exit];
    }
    
    NSLog(@"End");
    
    [pool release];
}

@end
