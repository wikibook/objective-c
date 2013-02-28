#import <Foundation/Foundation.h>

@interface MyObject : NSObject
{
}
- (void)doSomething:(NSString*)str;
@end

@implementation MyObject

- (void)doSomething:(NSString*)str
{
    // Objective-C 메서드에서 C언어 함수를 호출할 수 있음
    printf("%s", [str UTF8String]);
}

@end

void doSomething(void)
{
    // C언어 함수에서 Objective-C 클래스의 인스턴스 생성할 수 있음
    NSString* str = [NSString stringWithString:@"TEST"];
    // C언어 함수에서 Objective-C 클래스의 메서드를 호출할 수 있음
    str = [str stringByAppendingString:@" STRING"];
    // C언어 함수를 호출할 수 있음
    printf("%s\n", [str UTF8String]);
}

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    MyObject* myObject = [[MyObject alloc] init];
    [myObject doSomething:@"Objective-C method\n"];
    
    doSomething();
    
    [pool drain];
    return 0;
}
