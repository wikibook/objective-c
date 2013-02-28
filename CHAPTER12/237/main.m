#import <Foundation/Foundation.h>
#import "MyObject.h"

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 인스턴스를 생성
    MyObject *obj = [[[MyObject alloc] init] autorelease];
    
    // 통지
    [obj post];
    
    [pool drain];
    return 0;
}
