#import <Foundation/Foundation.h>
#import "MyClass.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    // 비교할 인스턴스를 생성
    MyClass *p1 = [[[MyClass alloc] initWithValue:10] autorelease];
    MyClass *p2 = [[[MyClass alloc] initWithValue:10] autorelease];
    MyClass *p3 = [[[MyClass alloc] initWithValue:15] autorelease];
    NSString *str = [NSString stringWithString:@"10"];
    
    // 같은 값을 가진 인스턴스를 비교함 
    NSLog(@"[p1 isEqual:p2]=%d", [p1 isEqual:p2]);
    // 다른 값을 가진 인스턴스를 비교함 
    NSLog(@"[p1 isEqual:p3]=%d", [p1 isEqual:p3]);
    // 다른 클래스의 인스턴스를 비교함 
    NSLog(@"[p1 isEqual:str]=%d", [p1 isEqual:str]);
    
    [pool drain];
    return 0;
}
