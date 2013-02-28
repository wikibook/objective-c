#import "MyObject.h"

@implementation MyObject
@synthesize counter = _counter;

- (id)init
{
    self = [super init];
    if (self)
    {
        _counter = 10;  // 카운터 초기화 
    }
    return self;
}

- (void)countWithTimer:(NSTimer *)timer
{
    [self setCounter:[self counter] - 1];
    NSLog(@"%ld", (long)[self counter]);
}

@end
