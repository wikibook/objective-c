#import "MyObject.h"

@implementation MyObject

- (id)initWithParent:(id)parent
{
    self = [super init];
    if (self)
    {
        _intValue = 10;
        
        if (parent)
        {
            _str = [[NSString alloc]
                    initWithString:@"Child"];
        }
        else
        {
            _str = [[NSString alloc]
                    initWithString:@"Parent"];
        }
        
        _parent = parent;
    }
    return self;
}

- (void)dealloc
{
    [_str release];
    [super dealloc];
}

// 인코더에 데이터를 저장하는 처리 
- (void)encodeWithCoder:(NSCoder *)coder
{
    // 부모 클래스의 데이터를 저장하는 처리
    // ‘NSObject’ 클래스는 ‘encodeWithCoder:’ 메서드를 구현하지 않으므로 호출 안 함 
    // [super encodeWithCoder:coder];
    
    // 정수를 키 ‘intValue’에 저장
    [coder encodeInteger:_intValue
                  forKey:@"intValue"];
    
    // 문자열을 키 ‘stringValue’에 저장
    [coder encodeObject:_str
                 forKey:@"stringValue"];
    
    // 부모 오브젝트와의 연관성을 키 ‘parent’에 저장
    [coder encodeConditionalObject:_parent
                            forKey:@"parent"];
}

@end
