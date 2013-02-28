#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 인스턴스를 생성 
    id str = [NSString string];
    
    // 인스턴스에서 클래스를 취득
    Class c = [str class];
    
    NSLog(@"%@", [c description]);
    
    [pool drain];
    return 0;
}
