#import "MyClass.h"
#import "MyMutableClass.h"

@implementation MyClass

// ‘initWithInteger:’ 메서드가 사용되지 않을 때를 대비해 정의
- (id)init
{
    self = [super init];
    if (self)
    {
        _integerValue = 0;
    }
    return self;
}

// 값을 받아 초기화하는 이니셜라이져
- (id)initWithInteger:(NSInteger)i
{
    self = [self init]; // 부모 클래스의 이니셜라이져를 호출하는 메서드는 하나로 함
                    
    if (self)
    {
        _integerValue = i;
    }
    return self;
}

// 값을 취득하는 메서드
- (NSInteger)integerValue
{
    return _integerValue;
}

// ‘불변’ 인스턴스를 생성
- (id)copyWithZone:(NSZone*)zone
{
    // ‘NSZone’을 사용해 인스턴스를 생성
    // 생성한 인스턴스는 이니셜라이져로 초기화함
    MyClass *newInstance = [[[self class] allocWithZone:zone]
                            initWithInteger:_integerValue];
    return newInstance;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    // ‘가변’ 인스턴스는 ‘MyMutableClass’ 클래스의
    // 인스턴스이므로 ‘MyMutableClass’를 지정해서 ‘NSZone’을
    // 사용할 인스턴스를 생성
    MyMutableClass *newInstance = [[MyMutableClass allocWithZone:zone]
                                   initWithInteger:_integerValue];
    return newInstance;
}

@end
