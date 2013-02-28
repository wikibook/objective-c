#import <Foundation/Foundation.h>
#import "MyClass.h"

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // 클래스명으로 클래스 취득 
    Class c = NSClassFromString(@"MyClass");
    
    // 인스턴스 생성 
    id obj = [[[c alloc] init] autorelease];
    
    NSLog(@"%@", obj);
    
    [pool drain];
    return 0;
}
