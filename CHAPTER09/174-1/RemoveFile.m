#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 파일 삭제
    // 아래 경로는 알맞게 변경해주세요
    // 여기에서는 ‘/Users/gaheeyoon/Test.txt’를 삭제
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = @"/Users/gaheeyoon/Test.txt";
    
    BOOL ret = [fileManager removeItemAtPath:path
                                       error:NULL];
    
    [pool drain];
    return 0;
}
