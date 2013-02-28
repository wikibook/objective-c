#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 번들을 취득
    // 여기에서는 파일 경로로 번들을 지정
    NSBundle *bundle;
    bundle = [NSBundle bundleWithPath:
              @"/System/Library/Frameworks/Foundation.framework"];
    
    // 리소스 파일의 경로를 취득
    // 여기에서는 ‘Info.plist’를 취득
    NSString *path;
    
    path = [bundle pathForResource:@"Info"
                            ofType:@"plist"];
    
    NSLog(@"%@", path);
    
    [pool drain];
    return 0;
}
