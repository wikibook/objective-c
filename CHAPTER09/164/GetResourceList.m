#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 번들을 취득
    // 여기에서는 ‘Foundation.framework’을 취득
    NSBundle *bundle;
    bundle = [NSBundle bundleWithPath:
              @"/System/Library/Frameworks/Foundation.framework"];

    // 리소스 파일의 목록을 취득
    // 여기에서는 ‘plist’ 의 목록을 취득
    NSArray *paths;
    paths = [bundle pathsForResourcesOfType:@"plist"
                                inDirectory:nil];
    
    NSLog(@"%@", paths);
    
    [pool drain];
    return 0;
}
