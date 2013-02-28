#import <Foundation/Foundation.h>
#import "MyClass.h"
#import "MyMutableClass.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // '불변' 인스턴스 생성
    MyClass *p1 = [[[MyClass alloc] initWithInteger:10] autorelease];
    
    // '불변' 인스턴스 생성
    // 이때 'copy' 메서드에서 'copyWithZone:' 메서드가 호출됨
    MyClass *p2 = [[p1 copy] autorelease];
    
    // ‘가변’ 인스턴스 생성
    // 이때 ‘mutableCopy’ 메서드에서 ‘mutableCopyWithZone:’ 메서드가 호출됨
    MyMutableClass *p3 = [[p1 mutableCopy] autorelease];
    
    // '가변' 클래스의 변경 메서드를 호출 
    [p3 setInteger:15];
    
    // 각 값을 로그에 출력
    NSLog(@"p1=%ld, p2=%ld, p3=%ld", 
          [p1 integerValue],
          [p2 integerValue],
          [p3 integerValue]);
    
    [pool drain];
    return 0;
}
