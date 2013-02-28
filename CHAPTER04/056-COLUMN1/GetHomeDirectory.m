#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 홈 디렉터리를 의미하는 ‘~’를 확장해서 절대경로를 취득
    NSString *path;
    path = [[NSString stringWithString:@"~/Documents"]
            stringByExpandingTildeInPath];

    NSLog(@"%@", path);
    [pool drain];
    return 0;
}
