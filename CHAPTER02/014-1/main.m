#import <Foundation/Foundation.h>
#import "enum.h"

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 열거를 사용할 때는 수치 대신에 열거할 상수명을 씀
    NSLog(@"OneObjectType=%d", OneObjectType);
    NSLog(@"TwoObjectType=%d", TwoObjectType);
    NSLog(@"ThreeObjectType=%d", ThreeObjectType);
    
    [pool drain];
    return 0;
}
