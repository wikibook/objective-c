#import "MyClass.h"

@implementation MyClass

- (id)init
{
    self = [super init];
    if (self)
    {
        _val = 15;
        _strValue = [[NSString alloc] initWithString:@"The String"];
    }
    return self;
}

- (void)dealloc
{
    [_strValue release];
    [super dealloc];
}

// 변수 '_val'의 값을 반환 
- (NSInteger)integerValue
{
    return _val;
}

@end
