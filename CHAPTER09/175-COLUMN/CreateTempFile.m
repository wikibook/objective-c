#import <Foundation/Foundation.h>

// 임시 파일을 생성해 생성한 파일 경로를 반환
NSString * CreateTempFile(NSString *prefix, NSString* pathExtension)
{
    // 임시 디렉터리를 취득
    NSString *dir = NSTemporaryDirectory();

    // 준비
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = nil;
    BOOL retry = YES;
    
    do
    {
        // 난수를 생성 
        int i = random();
        
        // 파일명을 생성 
        path = [[dir stringByAppendingPathComponent:
                 [NSString stringWithFormat:@"%@%X", prefix, i]]
                stringByAppendingPathExtension:pathExtension];
        
        // 파일이 생성되면 루프를 종료
        if (![fileManager fileExistsAtPath:path])
        {
            retry = ![fileManager createFileAtPath:path
                                          contents:nil
                                        attributes:nil];
        }
        
    } while (retry);
    return path;
}

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 난수의 초기화
    srandomdev();
    
    // 임시 파일을 생성 
    NSString *tempFile = CreateTempFile(@"App", @"txt");
    
    NSLog(@"Temporary File : %@", tempFile);
    
    // 삭제
    [[NSFileManager defaultManager] removeItemAtPath:tempFile
                                               error:NULL];
    
    [pool drain];
    return 0;
}
