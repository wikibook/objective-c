#import "MyObject.h"

@implementation MyObject

// 서브쓰레드에서 실행하는 메서드
- (void)threadProc:(id)anArgument
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSLog(@"Start sub-thread");
    
    // 메인 쓰레드에 메서드 호출을 의뢰
    // 여기에서는 ‘log:’ 메서드를 의뢰
    [self performSelectorOnMainThread:@selector(log:)
                           withObject:nil
                        waitUntilDone:YES];
    
    NSLog(@"End sub-thread");
    [pool drain];
}

- (void)log:(id)anObject
{
    NSLog(@"Perform @selector(log:)");
}

@end
