#import "MyOperation.h"

@implementation MyOperation

- (id)initWithName:(NSString *)name
{
    self = [super init];
    if (self)
    {
        _name = [name retain];
    }
    return self;
}

- (void)dealloc
{
    [_name release];
    [super dealloc];
}

// 오퍼레이션이 실행할 메서드
- (void)main
{
    long value = random();
    
    // 난수로 발생시킨 값을 인수분해 한다
    NSMutableArray *factors = [NSMutableArray arrayWithCapacity:0];
    
    long curValue = value;
    long l = 2;
    
    while (l < curValue)
    {
        // 나머지가 없다면 인수
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
    
    // 값과 이름을 로그에 출력
    NSLog(@"%@: %ld=%@",
          _name, value, factors);
}

@end
