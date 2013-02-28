#import "MyThreadObject.h"

@implementation MyThreadObject
@synthesize conditionLock = _conditionLock;

- (id)init
{
    self = [super init];
    if (self)
    {
        // 변수의 배타제어에 사용할 재귀락을 생성
        _conditionLock = nil;
        _integerValue = 0;
    }
    return self;
}

- (void)dealloc
{
    [_conditionLock release];
    [super dealloc];
}

// 값을 취득하는 메서드
- (NSInteger)integerValue
{
    NSInteger ret = 0;
    
    // 쓰레드 사이에서 공유할 변수이므로 배타제어를 함 
    // ‘@synchronized’ 구문을 사용
    @synchronized(self)
    {
        ret = _integerValue;
    }
    
    return ret;
}

// 별도의 쓰레드로 실행하는 메서드
- (void)threadProc:(id)anArgument
{
    // 별도 쓰레드용 자동소멸 풀
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 1초마다 값을 증가시켜 5 이상이 되면 종료
    BOOL isContinue = YES;
    while (isContinue)
    {
        NSAutoreleasePool *subPool = [[NSAutoreleasePool alloc] init];
        
        // 값을 증가
        // 쓰레드 사이에서 공유할 변수이므로 배타제어를 함
        // ‘@synchronized’ 구문을 사용
        @synchronized(self)
        {
            _integerValue++;
            if (_integerValue > 5)
            {
                isContinue = NO;
            }
        }
        
        // 1초간 슬립
        if (isContinue)
        {
            [NSThread sleepUntilDate:
             [NSDate dateWithTimeIntervalSinceNow:1]];
        }
        
        [subPool drain];
    }
    
    // 종료됐음을 알리기 위해 상태변수포함 락의 상태변수를 1 증가
    NSConditionLock *lock = [self conditionLock];
    
    [lock lock];
    [lock unlockWithCondition:([lock condition] + 1)];
    
    [pool drain];
}

@end
