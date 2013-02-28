#import <Foundation/Foundation.h>
#import "MyObject.h"

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 인스턴스 생성
    MyObject *obj = [[[MyObject alloc] init] autorelease];
    
    // 호출 메서드의 셀렉터 취득
    SEL sel = @selector(cube:);
    
    // 메서드 시그니쳐 취득
    NSMethodSignature *signature;

    signature = [obj methodSignatureForSelector:sel];
    
    // ‘NSInvocation’ 클래스의 인스턴스 생성
    NSInvocation *invocation;
    
    invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    // 셀렉터 지정
    [invocation setSelector:sel];
    
    // 파라미터의 값 설정
    // 파라미터의 인덱스 번호는 2부터 시작 
    // 여기에서는 ‘3’을 전달
    NSInteger value = 3;
    
    [invocation setArgument:&value
                    atIndex:2];
    
    // 메서드 호출
    [invocation invokeWithTarget:obj];
    
    // 반환값 취득
    [invocation getReturnValue:&value];
    
    NSLog(@"%ld", (long)value);
    
    [pool drain];
    return 0;
}
