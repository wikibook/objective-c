#import <Foundation/Foundation.h>
#import "MyThreadObject.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    srandomdev();
    
    // 쓰레드를 생성하기 위한 인스턴스를 생성
    MyThreadObject *obj = [[[MyThreadObject alloc] init] autorelease];
    
    // 상태변수포함 락을 통해 쓰레드의 종료를 대기
    NSConditionLock *conditionLock;
    
    conditionLock = [[[NSConditionLock alloc] initWithCondition:0]
                     autorelease];
    
    [obj setConditionLock:conditionLock];
    
    // 쓰레드를 생성
    [NSThread detachNewThreadSelector:@selector(threadProc:)
                             toTarget:obj
                           withObject:nil];
    
    // 쓰레드의 종료까지 대기
    [conditionLock lockWhenCondition:1];
    [conditionLock unlock];
    
    [pool drain];
    return 0;
}
