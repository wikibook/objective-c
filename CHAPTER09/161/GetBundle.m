#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 번들을 취득 
    NSBundle *bundle;
    bundle = [NSBundle bundleWithPath:
              @"/System/Library/Frameworks/Foundation.framework"];
    
    NSLog(@"%@", bundle);
    
    [pool drain];
    return 0;
}
