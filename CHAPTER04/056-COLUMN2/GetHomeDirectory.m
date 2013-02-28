#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 사용자 ‘root’의 홈 디렉터리를 취득
    NSString *path;
    path = NSHomeDirectoryForUser(@"root");
    
    NSLog(@"%@", path);
    [pool drain];
    return 0;
}