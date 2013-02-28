#import "MyObject.h"

@implementation MyObject
@synthesize counter = _counter;

- (id)init
{
    self = [super init];
    if (self)
    {
        _counter = 10;  // 카운터 초기화 하기
    }
    return self;
}

- (void)countWithTimer:(NSTimer *)timer
          prefixString:(NSString *)prefixString
{
    [self setCounter:[self counter] - 1];
    NSLog(@"%@ - %ld", prefixString, (long)[self counter]);
}

@end
