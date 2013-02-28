#import <Foundation/Foundation.h>
#import "MyThreadObject.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    srandomdev();
    
    // 쓰레드를 생성하기 위해 인스턴스를 생성한다
    MyThreadObject *obj = [[[MyThreadObject alloc] init] autorelease];
    
    // 쓰레드를 두 개 생성
    // 마지막까지 실행하게 지정
    [NSThread detachNewThreadSelector:@selector(threadProc:)
                             toTarget:obj
                           withObject:[NSNumber numberWithBool:NO]];
    
    // 중단하게 지정
    [NSThread detachNewThreadSelector:@selector(threadProc:)
                             toTarget:obj
                           withObject:[NSNumber numberWithBool:YES]];

    // 2초 후에 프로그램이 종료 됨
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    
    [runLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    
    [pool drain];
    return 0;
}
