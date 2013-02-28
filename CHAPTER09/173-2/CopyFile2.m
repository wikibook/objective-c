#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 파일을 복사
    // 아래 경로는 알맞게 변경해주세요
    // 여기에서는 ‘/Users/gaheeyoon/Test.txt’를 ‘/Users/gaheeyoon/Test’ 디렉터리에 복사
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *srcPath = @"/Users/gaheeyoon/Test.txt";
    NSString *dstPath = @"/Users/gaheeyoon/Test/Test.txt";
    
    BOOL ret = [fileManager copyPath:srcPath
                              toPath:dstPath
                             handler:nil];
    
    [pool release];
    return 0;
}
