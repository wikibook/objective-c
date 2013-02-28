#import <Foundation/Foundation.h>
#import "MyThreadObject.h"
#import "MyThreadObserver.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 쓰레드의 중단을 통지 받는 인스턴스를 생성
    MyThreadObserver *observer = [[[MyThreadObserver alloc] init]
                                  autorelease];

    // 쓰레드를 생성하기 위해 인스턴스를 생성
    MyThreadObject *obj = [[[MyThreadObject alloc] init] autorelease];
    
    // 쓰레드를 생성
    // 중단하도록 설정
    [NSThread detachNewThreadSelector:@selector(threadProc:)
                             toTarget:obj
                           withObject:[NSNumber numberWithBool:YES]];
    
    // 프로그램은 2초 후에 종료됨
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    
    [runLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    
    [pool drain];
    return 0;
}