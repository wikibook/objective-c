#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 쓰기용 파일 핸들을 생성
    // 아래 파일경로는 알맞게 변경해주세요 (파일의 위치 및 파일명)
    // 여기에서는 ‘/Users/gaheeyoon/Test.txt’에 기록
    // ‘NSFileHandle’클래스는 생성 전에 파일이 디스크 상에 
    // 존재해야 하므로
    // 여기에서는 빈 파일을 미리 생성해두어야 함
    BOOL ret;
    
    ret = [[NSFileManager defaultManager]
           createFileAtPath:@"/Users/gaheeyoon/Test.txt"
           contents:nil
           attributes:nil];
    if (!ret)
    {
        // 파일 생성 실패
        NSLog(@"Failed to create a file");
        return 0;
    }
    
    // 파일 핸들 생성 
    NSFileHandle *fileHandle;
    
    fileHandle = [NSFileHandle fileHandleForWritingAtPath:
                  @"/Users/gaheeyoon/Test.txt"];
    if (!fileHandle)
    {
        // 파일 핸들 생성 실패
        NSLog(@"Failed to create a file-handle");
        return 0;
    }
    
    // 데이터 기록 
    // 문자열 'ABCDEFG'를 기록 
    NSData *data;
    
    data = [NSData dataWithBytes:"ABCDEFG"
                          length:7];
    [fileHandle writeData:data];

    // 파일크기를 작게 함
    // 여기에서는 3바이트로 함
    [fileHandle truncateFileAtOffset:3];
    
    // 파일을 닫음
    [fileHandle closeFile];
    
    [pool drain];
    return 0;
}
