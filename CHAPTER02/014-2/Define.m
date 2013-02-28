#import <Foundation/Foundation.h>
#import "Define.h"

int main (int argc, const char * argv[]) 
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 정의한 상수를 사용할 때는 값 대신에 상수명을 기술함
    NSLog(@"InitialValue=%d", InitialValue);
    NSLog(@"InitialString=%s", InitialString);
    
    [pool drain];
    return 0;
}
