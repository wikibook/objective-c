#import <Foundation/Foundation.h>
#import "MyThreadObject.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    NSLog(@"start");
    
    // 쓰레드를 생성하기 위해 인스턴스를 생성
    MyThreadObject *obj = [[[MyThreadObject alloc] init] autorelease];
    
    // 쓰레드의 종료 대기는 상태변수포함 락에서 함
    NSConditionLock *conditionLock;
    
    conditionLock = [[[NSConditionLock alloc] initWithCondition:0]
                     autorelease];
    
    [obj setConditionLock:conditionLock];
    
    // 쓰레드를 생성
    [NSThread detachNewThreadSelector:@selector(threadProc:)
                             toTarget:obj
                           withObject:nil];
    
    // 상태변수가 1이 될 때까지 대기
    [conditionLock lockWhenCondition:1];
    [conditionLock unlock];
    
    NSLog(@"end");
    
    [pool drain];
    return 0;
}
