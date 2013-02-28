#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // 디렉터리를 생성
    // 아래 경로는 알맞게 변경해주세요
    // 여기에서는 ‘/Users/gaheeyoon/Test’ 디렉터리를 생성
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = @"/Users/gaheeyoon/Test";
    
    BOOL ret = [fileManager createDirectoryAtPath:path
                                       attributes:nil];
    
    [pool release];
    return 0;
}
