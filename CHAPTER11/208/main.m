#import <Foundation/Foundation.h>
#import "MyClass.h"

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // 인스턴스 생성 
    id str = [NSString string];
    id myObj = [[[MyClass alloc] init] autorelease];
    
    // 인스턴스에서 클래스를 취득하고 클래스로부터 클래스명을 취득
    NSLog(@"%@", NSStringFromClass([str class]));
    NSLog(@"%@", NSStringFromClass([myObj class]));
    
    [pool drain];
    return 0;
}
