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

// 별도의 쓰레드로 실행할 메서드
- (void)threadProc:(id)anArgument
{
    // 별도의 쓰레드용 자동소멸 풀
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 10까지 카운트
    NSInteger i;
    for (i = 0; i < 10; i++)
    {
        NSLog(@"%i", i + 1);
        
        // 2초간 슬립
        [NSThread sleepUntilDate:
         [NSDate dateWithTimeIntervalSinceNow:2]];
    }
    
    // 종료됐음을 통지하기 위해 상태변수포함락의 상태변수를 1 증가
    NSConditionLock *lock = [self conditionLock];
    
    [lock lock];
    [lock unlockWithCondition:([lock condition] + 1)];
    
    [pool release];
}

@end
