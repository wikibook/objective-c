#import "MyThreadObject.h"

@implementation MyThreadObject

- (id)init
{
    self = [super init];
    if (self)
    {
        // 상태변수포함 락을 생성 
        _conditionLock = [[NSConditionLock alloc] initWithCondition:0];
    }
    return self;
}

- (void)dealloc
{
    [_conditionLock release];
    [super dealloc];
}

// 쓰레드를 중단할 메서드 
- (void)stopThread
{
    // 상태변수를 변경하기 위해 락을 검
    [_conditionLock lock];
    
    // 상태변수의 값을 변경하고서 락을 해제 
    [_conditionLock unlockWithCondition:1];
}

// 별도 쓰레드에서 실행하는 메서드 
- (void)threadProc:(id)anArgument
{
    // 별도 쓰레드용 자동소멸풀 
    NSAutoreleasePool *threadPool = [[NSAutoreleasePool alloc] init];
    BOOL isContinue = YES;
    
    NSLog(@"Start");
    
    // 변수 ‘isContinue’가 ‘YES’면 계속 루프
    do
    {
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        
        // 상태변수의 값을 조사
        // 상태변수포함 락을 멤버 변수로 정의
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0.2];
        
        if ([_conditionLock lockWhenCondition:1
                                   beforeDate:date])
        {
            // 상태변수가 ‘1’이면 락이 걸렸다는 뜻이므로 루프를 중단
            isContinue = NO;
            [_conditionLock unlock];
        }
        
        if (isContinue)
        {
            // 쓰레드에서 실행할 처리 
            printf(".");
        }
        [pool release];
    } while (isContinue);
    
    NSLog(@"End");
    [threadPool drain];
}

@end