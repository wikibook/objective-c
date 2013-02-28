#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 디렉터리 계층의 파일이나 디렉터리를 순서대로 취득
    // 아래 경로는 알맞게 변경해주세요
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *dirPath = @"/Users/gaheeyoon/Test";
    NSDirectoryEnumerator *enumerator;
    
    // 디렉터리용 열거자를 취득
    enumerator = [fileManager enumeratorAtPath:dirPath];
    
    NSString *path;
    while (path = [enumerator nextObject])
    {
        // ‘nextObject’ 메서드가 반환하는 문자열은 디렉터리 계층의 부분이므로 
        // 디렉터리 경로를 연결
        path = [dirPath stringByAppendingPathComponent:path];
        NSLog(@"%@", path);
    }
    
    [pool drain];
    return 0;
}
