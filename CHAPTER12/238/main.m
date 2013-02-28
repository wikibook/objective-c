#import <Foundation/Foundation.h>
#import "MyObject.h"
#import "MyObserver.h"

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // 인스턴스를 생성 
    MyObject *obj = [[[MyObject alloc] init] autorelease];
    MyObserver *observer = [[[MyObserver alloc] init] autorelease];
    
    [obj post];
    
    [pool drain];
    return 0;
}
