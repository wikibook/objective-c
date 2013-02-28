#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
    // 홈 디렉터리를 취득
    NSString *path;
    path = NSHomeDirectory();
    
    NSLog(@"%@", path);
    [pool drain];
    return 0;
}