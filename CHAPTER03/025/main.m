#import <Foundation/Foundation.h>

// ‘MyClass1’ 클래스 정의
@interface MyClass1 : NSObject
{
}
@end

// 'MyClass2' 클래스 정의 
@interface MyClass2 : NSObject
{
}
- (void)doSomething;
@end

// 'MyClass1' 클래스의 구현 코드
@implementation MyClass1
@end

// 'MyClass2' 클래스의 구현 코드
@implementation MyClass2
- (void)doSomething
{
}
@end


int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 둘 다 'MyClass1' 클래스의 인스턴스를 생성하고 있음
    MyClass1 *p1 = [[[MyClass1 alloc] init] autorelease];
    id p2 = [[[MyClass1 alloc] init] autorelease];
    
    // ‘MyClass1’ 클래스에는 없는 메서드이므로 경고가 표시됨
    [p1 doSomething];
    
    // 컴파일러는 변수 ‘p2’가 ‘MyClass1’ 클래스의 인스턴스인지
    // ‘MyClass2’ 클래스의 인스턴스인지 판단하지 못함
    // ‘MyClass2’ 클래스에서 정의된 메서드이므로 경고가 표시되지 않음
    [p2 doSomething];
    
    // ‘MyClass1’ 클래스와 ‘MyClass2’ 클래스 모두 
    // 정의되지 않은 메서드이므로 경고가 표시됨    
    [p2 doSomething2];
    
    [pool drain];
    return 0;
}
