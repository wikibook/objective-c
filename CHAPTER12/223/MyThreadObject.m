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
    // 별도 쓰레드 용 자동소멸 풀
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    long value = random();
    
    // 난수로 발생시킨 값을 인수분해 함
    NSMutableArray *factors = [NSMutableArray arrayWithCapacity:0];
    
    long curValue = value;
    long l = 2;
    
    while (l < curValue)
    {
        // 나머지가 없으면 인수
        if (curValue % l == 0)
        {
            [factors addObject:[NSNumber numberWithLong:l]];
            curValue /= l;
            l = 2;
        }
        else
        {
            l++;
        }
        
    }
    
    if (curValue != 1)
    {
        [factors addObject:[NSNumber numberWithLong:curValue]];
    }
    
    // 값과 쓰레드명을 로그에 출력
    // 쓰레드명은 쓰레드를 생성하는 쪽에서 이 메서드의 파라미터로 지정
    // 실행 중인 각 쓰레드는 독립적으로 동작하므로 계산이 끝난 것부터 로그에 출력시킴
    NSLog(@"%@: %ld=%@",
          anArgument, value, factors);
    
    // 종료를 통지하기 위해 상태변수포함 락의 상태변수를 1 증가시킴
    NSConditionLock *lock = [self conditionLock];
    
    [lock lock];
    [lock unlockWithCondition:([lock condition] + 1)];
    
    [pool release];
}

@end
