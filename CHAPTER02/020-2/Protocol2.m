#import <Foundation/Foundation.h>

// 프로토콜을 정의
@protocol MyCallbackProtocol <NSObject>
- (int)doCalc:(int)num;
@end

// ‘MyClass1’ 클래스에서 ‘MyCallbackProtocol’ 프로토콜을 포함하고 있음을 선언
@interface MyClass1 : NSObject <MyCallbackProtocol>
{
}
@end

// ‘MyClass2’ 클래스는 프로토콜을 선언하지 않음
@interface MyClass2 : NSObject
{
}
@end

// ‘MyClass3’ 클래스는 프로토콜을 지원하지 않음
@interface MyClass3 : NSObject
{
}
@end

// ‘MyClass4’ 클래스에서 ‘MyCallbackProtocol’ 프로토콜을 포함하고 있음을 선언
@interface MyClass4 : NSObject <MyCallbackProtocol>
{
}
@end


// ‘MyClass1’ 클래스를 구현
@implementation MyClass1
- (int)doCalc:(int)num
{
    return (num * num);
}
@end

// ‘MyClass2’ 클래스를 구현
@implementation MyClass2
- (int)doCalc:(int)num
{
    return (num * num * num);
}
@end

// ‘MyClass3’ 클래스를 구현
@implementation MyClass3
@end

// ‘MyClass4’ 클래스를 구현
// ‘MyCallbackProtocol’ 프로토콜을 구현한다고 선언했으나 
// 필요한 메서드를 구현하지 않음
@implementation MyClass4
@end


// 메인 함수
int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // ‘MyCallbackProtocol’ 프로토콜을 구현한 인스턴스의 배열을 정의
    id<MyCallbackProtocol> cbs[] = {
        [[[MyClass1 alloc] init] autorelease],
        [[[MyClass2 alloc] init] autorelease],
        [[[MyClass3 alloc] init] autorelease],
        [[[MyClass4 alloc] init] autorelease]
    };
    
    // 각 인스턴스가 프로토콜에 적합한지 조사
    int i;
    for (i = 0; i < 4; i++)
    {
        Protocol *protocol = @protocol(MyCallbackProtocol);
        BOOL b = [cbs[i] conformsToProtocol:protocol];
        NSLog(@"instance %d conforms to protocol : %d", i, b);
        
        b = [cbs[i] respondsToSelector:@selector(doCalc:)];
        NSLog(@"instance %d responds to selector : %d", i, b);
    }
    
    [pool drain];
    return 0;
}
