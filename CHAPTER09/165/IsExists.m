#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 디렉터리가 존재하는지 조사
    // 여기에서는 ‘/Developer’ 디렉터리가 존재하는지 조사
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = @"/Developer";
    
    BOOL isExists = [fileManager fileExistsAtPath:path];
    
    NSLog(@"'%@' is exists : %d", path, isExists);
    
    [pool drain];
    return 0;
}
