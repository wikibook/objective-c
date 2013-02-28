#import <Foundation/Foundation.h>
#import "Const.h"

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 정의한 상수를 사용하려면 값 대신에 상수명을 씀
    NSLog(@"InitialValue=%d", InitialValue);
    
    [pool drain];
    return 0;
}
