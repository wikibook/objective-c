#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 이름을 변경
    // 아래 경로는 알맞게 변경해주세요
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *srcPath = @"Users/gaheeyoon/Test.txt";
    NSString *dstPath = @"Users/gaheeyoon/Test2.txt";
    
    BOOL ret = [fileManager moveItemAtPath:srcPath
                                    toPath:dstPath
                                     error:NULL];
    
    [pool drain];
    return 0;
}