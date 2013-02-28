#import <Foundation/Foundation.h>
#import "MyThreadObject.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    srandomdev();

    // 쓰레드를 생성하기 위한 인스턴스를 생성한다
    MyThreadObject *obj = [[[MyThreadObject alloc] init] autorelease];
    
    // 쓰레드의 종료 대기는 상태변수포함 락에서 함
    NSConditionLock *conditionLock;
    
    conditionLock = [[[NSConditionLock alloc] initWithCondition:0]
                     autorelease];
    
    [obj setConditionLock:conditionLock];
    
    // 쓰레드를 다섯개 생성
    NSInteger i;
    for (i = 0; i < 5; i++)
    {
        // 쓰레드에 전달할 문자열을 생성
        NSString *threadName;
        threadName = [NSString stringWithFormat:@"Thread %d", i+1];
        
        // 쓰레드를 생성
        [NSThread detachNewThreadSelector:@selector(threadProc:)
                                 toTarget:obj
                               withObject:threadName];
    }
    
    // 쓰레드가 종료할 때까지 대기
    // 다섯 개의 쓰레드가 모두 종료되어 상태변수가 5가 될 때까지 대기
    [conditionLock lockWhenCondition:5];
    [conditionLock unlock];
    
    [pool drain];
    return 0;
}
