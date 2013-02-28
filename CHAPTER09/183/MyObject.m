#import "MyObject.h"

@implementation MyObject

- (id)initWithCoder:(NSCoder *)coder
{
    // 부모 클래스의 읽어오기 처리를 호출
    // ‘NSObject’ 클래스는 ‘initWithCoder:’ 메서드를 구현하고 있지 않으므로 
    // ‘init’ 메서드를 호출
    // self = [super initWithCoder:coder];
    self = [super init];
    if (self)
    {
        // 정수를 키 ‘initValue’로 읽어옴
        _intValue = [coder decodeIntegerForKey:@"intValue"];
        
        // 문자열을 키 ‘stringValue’로 읽어옴
        _str = [[coder decodeObjectForKey:@"stringValue"] retain];
        
        // 부모 클래스와의 관련성을 키 ‘parent’로 읽어옴
        _parent = [coder decodeObjectForKey:@"parent"];
    }
    return self;
}

- (void)dealloc
{
    [_str release];
    [super dealloc];
}

- (NSString *)description
{
    unsigned int u1 = (unsigned int)self;
    unsigned int u2 = (unsigned int)_parent;
    
    return [NSString stringWithFormat:
            @"0x%X, intValue=%d, str=%@, parent=0x%08X",
            u1,
            _intValue,
            _str,
            u2];
}

@end
