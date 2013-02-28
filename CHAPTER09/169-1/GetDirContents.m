#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 디렉터리의 파일이나 디렉터리를 취득
    // 아래 파일경로는 알맞게 변경해주세요 (파일의 위치 및 파일명)
    // 여기에서는 '/Users/gaheeyoon/Test' 디렉터리의 내용을 취득
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = @"/Users/gaheeyoon/Test";
    
    NSArray *items = [fileManager contentsOfDirectoryAtPath:path
                                                      error:NULL];
    
    NSLog(@"%@", items);
    
    [pool drain];
    return 0;
}
