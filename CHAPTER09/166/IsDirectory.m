#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 디렉터리인지 파일인지 조사
    // 여기에서는 ‘/Developer’ 디렉터리에 대해 조사
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = @"/Developer";
    BOOL isDir;
    
    BOOL isExists = [fileManager fileExistsAtPath:path
                                      isDirectory:&isDir];
    
    NSLog(@"'%@' is directory : %d", path, isDir);
    
    [pool drain];
    return 0;
}
