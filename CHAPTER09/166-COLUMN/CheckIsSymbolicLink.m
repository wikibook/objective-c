#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 심볼릭링크 파일인지 아닌지를 조사하는 경로
    // 여기에서는 루트 디렉토리에 'TestSymLinkFile'라는 이름의 
    // 심볼릭링크 파일이 있다고 가정함 
    NSString *path = @"/TestSymLinkFile";
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // 속성을 취득 
    NSDictionary *attrDict;
    attrDict = [fileManager attributesOfItemAtPath:path
                                             error:NULL];
    
    // 파일 타입을 취득하고 심볼릭링크 파일인지 조사
    BOOL isSymbolicLink = NO;
    if ([[attrDict objectForKey:NSFileType]
         isEqualToString:NSFileTypeSymbolicLink])
    {
        // 변수 ‘path’는 심볼릭링크 파일
        isSymbolicLink = YES;
    }
    
    NSLog(@"'%@' is a symbolic link file : %d",
          path, isSymbolicLink);
    
    [pool drain];
    return 0;
}
