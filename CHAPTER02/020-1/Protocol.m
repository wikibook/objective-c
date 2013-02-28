#import <Foundation/Foundation.h>

// 프로토콜을 정의함
@protocol MyCallbackProtocol <NSObject>
- (int)doCalc:(int)num;
@end

// ‘MyClass1’ 클래스에서 ‘MyCallbackProtocol’ 프로토콜을 포함하고 있음을 선언
@interface MyClass1 : NSObject <MyCallbackProtocol>
{
}
@end

// ‘MyClass2’ 클래스에서 ‘MyCallbackProtocol’ 프로토콜을 포함하고 있음을 선언
@interface MyClass2 : NSObject <MyCallbackProtocol>
{
}
@end

// ‘MyClass1’ 클래스 구현
@implementation MyClass1
- (int)doCalc:(int)num
{
    return (num * num);
}
@end

// ‘MyClass2’ 클래스 구현
@implementation MyClass2
- (int)doCalc:(int)num
{
    return (num * num * num);
}
@end

// 메인 함수
int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // ‘MyCallbackProtocol’ 프로토콜을 포함한 인스턴스 배열을 정의
    id<MyCallbackProtocol> cbs[] = {
        [[[MyClass1 alloc] init] autorelease],
        [[[MyClass2 alloc] init] autorelease]
    };
    
    // 배열의 각 엘리먼트에서 메서드를 호출
    int i;
    for (i = 0; i < 2; i++)
    {
        // 인스턴스의 클래스와 관계없이 ‘MyCallbackProtocol’을 구현하고 있다면 
        // ‘doCalc:’ 메서드를 갖고 있으므로 그것을 호출
        int j = [cbs[i] doCalc:4];
        NSLog(@"%d", j);
    }
    
    [pool drain];
    return 0;
}
