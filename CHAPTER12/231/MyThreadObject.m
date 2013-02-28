#import "MyThreadObject.h"

@implementation MyThreadObject
@synthesize conditionLock = _conditionLock;

- (id)init
{
    self = [super init];
    if (self)
    {
        // 변수의 배타제어에 사용할 재귀 락을 생성
        _lock = [[NSRecursiveLock alloc] init];
        _conditionLock = nil;
        _integerValue = 0;
    }
    return self;
}

- (void)dealloc
{
    [_conditionLock release];
    [_lock release];
    [super dealloc];
}

// 값을 취득하는 메서드
- (NSInteger)integerValue
{
    NSInteger ret = 0;
    
    // 쓰레드 사이에서 공유할 변수이므로 배타제어를 함 
    // ‘재귀 락’을 사용
    [_lock lock];
    ret = _integerValue;
    [_lock unlock];
    
    return ret;
}

// 별도의 쓰레드로 실행할 메서드
- (void)threadProc:(id)anArgument
{
    // 별도 쓰레드용의 자동소멸 풀
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 1초마다 값을 증가시켜 5 이상이면 종료
    BOOL isContinue = YES;
    while (isContinue)
    {
        NSAutoreleasePool *subPool = [[NSAutoreleasePool alloc] init];
        
        // 값을 증가
        // 쓰레드 사이에서 공유할 변수이므로 배타제어를 함
        // ‘재귀 락’을 사용
        [_lock lock];
        
        _integerValue++;
        if (_integerValue > 5)
        {
            isContinue = NO;
        }
        
        // 락을 해제
        [_lock unlock];
        
        // 1초간 슬립
        if (isContinue)
        {
            [NSThread sleepUntilDate:
             [NSDate dateWithTimeIntervalSinceNow:1]];
        }
        
        [subPool drain];
    }
    
    // 끝난 것을 알리기 위해 상태변수포함 락의 상태변수를 1 증가
    NSConditionLock *lock = [self conditionLock];
    
    [lock lock];
    [lock unlockWithCondition:([lock condition] + 1)];
    
    [pool drain];
}

@end
