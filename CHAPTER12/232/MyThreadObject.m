#import "MyThreadObject.h"

@implementation MyThreadObject
@synthesize conditionLock = _conditionLock;

- (id)init
{
    self = [super init];
    if (self)
    {
        _conditionLock = nil;
    }
    return self;
}

- (void)dealloc
{
    [_conditionLock release];
    [super dealloc];
}

// 별도의 쓰레드에서 실행할 메서드
- (void)threadProc:(id)anArgument
{
    // 별도 쓰레드용 자동소멸 풀
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 5초 슬립
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    
    // 종료됐음을 알리기 위해 상태변수포함 락의 상태변수를 1 증가
    NSConditionLock *lock = [self conditionLock];
    
    [lock lock];
    [lock unlockWithCondition:([lock condition] + 1)];
    
    [pool drain];
}

@end
