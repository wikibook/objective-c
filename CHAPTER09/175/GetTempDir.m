#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 임시 디렉터리를 취득 
    NSString *tempDir = NSTemporaryDirectory();
    
    NSLog(@"%@", tempDir);
    
    [pool drain];
    return 0;
}
