#import <Foundation/Foundation.h>

@interface MyClass : NSObject
{
    NSString*   _str;
}
// 프로퍼티 정의를 사용할 수 없으므로 접근자 메서드를 선언
- (void)setStringValue:(NSString *)newValue;
- (NSString *)stringValue;
@end

@implementation MyClass

// 설정자 메서드 구현
- (void)setStringValue:(NSString *)newValue
{
    // 변수 ‘newValue’가 ‘_str’과 같은 인스턴스라면
    // ‘[_str release];’ 로 소멸되므로 다른 인스턴스인지 검사
    if (_str != newValue)
    {
        [_str release];
        _str = [newValue copy];
    }
}

// 접근자 메서드 구현
- (NSString *)stringValue;
{
    return _str;
}

@end

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    MyClass *c = [[[MyClass alloc] init] autorelease];
    
    // 설정자 메서드를 호출
    [c setStringValue:@"THE STRING"];
    // 접근자 메서드를 호출
    NSLog(@"%@", [c stringValue]);
    
    [pool drain];
    return 0;
}
