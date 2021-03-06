#import <Foundation/Foundation.h>
#import "MyThreadObject.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 쓰레드를 생성하기 위한 인스턴스를 생성
    MyThreadObject *obj = [[[MyThreadObject alloc] init] autorelease];
    
    // 쓰레드 종료 대기를 상태변수포함에서 함
    NSConditionLock *conditionLock;
    
    conditionLock = [[[NSConditionLock alloc] initWithCondition:0]
                     autorelease];
    
    [obj setConditionLock:conditionLock];
    
    // 쓰레드를 생성
    [NSThread detachNewThreadSelector:@selector(threadProc:)
                             toTarget:obj
                           withObject:nil];
    
    // 쓰레드가 종료될 때까지 루핑
    // 여기에서는 수시로 값을 취득해 값이 변할 때 마다 로그에 출력
    NSInteger i = 0;
    BOOL isContinue = YES;
    
    while (isContinue)
    {
        NSAutoreleasePool *subPool = [[NSAutoreleasePool alloc] init];
        
        // 쓰레드가 종료됐는지 확인
        // 여기에서는 타임아웃을 0.4초로 설정하고 상태변수가 바뀌면 종료
        NSDate *timeout = [NSDate dateWithTimeIntervalSinceNow:0.4];
        if ([conditionLock lockWhenCondition:1
                                  beforeDate:timeout])
        {
            isContinue = NO;
            [conditionLock unlock];
        }
        else
        {
            // 값을 취득 
            NSInteger value = [obj integerValue];
            if (value != i)
            {
                i = value;
                NSLog(@"%ld", (long)i);
            }
            else
            {
                NSLog(@".");
            }
        }
        
        [subPool drain];
    }
    
    [pool drain];
    return 0;
}
