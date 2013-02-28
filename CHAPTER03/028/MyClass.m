#import "MyClass.h"

@implementation MyClass

// 기억하는 수치를 파라미터로 받음 
- (id)initWithValue:(NSInteger)i
{
    self = [super init];
    if (self)
    {
        _integerValue = i;
    }
    return self;
}

// 접근자 메서드 
- (NSInteger)integerValue
{
    return _integerValue;
}

// 비교를 함 
- (BOOL)isEqual:(id)anObject
{
    // 주소가 같다면 같은 인스턴스 
    if (self == anObject)
    {
        return YES;
    }
    
    // 파라미터 'anObject'가 같은 클래스의 인스턴스인지 조사
    if (![anObject isKindOfClass:[self class]])
    {
        // 다른 클래스의 인스턴스이면 'NO'를 반환 
        return NO;
    }
    // 같은 클래스의 인스턴스이면 값을 취득해 비교함 
    return [self isEqualToMyClass:anObject];
}

// 전용 비교 메서드 
// 값을 기준으로 비교함
- (BOOL)isEqualToMyClass:(MyClass *)anObject
{
    if (self == anObject)
    {
        return YES;
    }
    return ([self integerValue] == [anObject integerValue]);
}

@end
