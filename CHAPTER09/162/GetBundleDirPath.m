#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 번들을 취득
    // 여기에서는 ‘NSString’ 클래스를 구현한 프레임워크를 취득
    NSBundle *bundle;
    bundle = [NSBundle bundleForClass:[NSString class]];
    
    // 번들의 디렉터리 경로를 취득
    NSString *path = [bundle bundlePath];
    NSLog(@"path : %@", path);
    
    [pool drain];
    return 0;
}
