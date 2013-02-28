#import <Foundation/Foundation.h>
#import "StringContant.h"

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 정의한 상수를 사용할 때는 문자열 대신 상수명을 씀
    NSLog(@"Constant=%@", MyIdentifier);
    
    [pool drain];
    return 0;
}
