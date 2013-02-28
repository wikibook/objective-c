#import <Foundation/Foundation.h>
#import "MyObject.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 인스턴스를 생성 
    MyObject *obj = [[[MyObject alloc] init] autorelease];
    
    // 서브쓰레드를 생성 
    [NSThread detachNewThreadSelector:@selector(threadProc:)
                             toTarget:obj
                           withObject:nil];
    
    // 3초간 런루프를 실행 
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    
    [runLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
    
    
    [pool drain];
    return 0;
}
