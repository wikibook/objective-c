#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 쓰기용 파일 핸들을 생성
    // 아래 파일경로는 알맞게 변경해주세요 (파일의 위치 및 파일명)
    // 여기에서는 ‘/Users/gaheeyoon/Test.txt’에 기록
    // ‘NSFileHandle’ 클래스는 생성 전에 파일이 디스크상에 
    // 있어야 하므로
    // 빈 파일을 미리 생성해 둬야 함
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
    
    // 데이터를 기록
    // 문자열 ‘ABCDEFG’를 기록
    NSData *data;
    
    data = [NSData dataWithBytes:"ABCDEFG"
                          length:7];
    [fileHandle writeData:data];
    
    // 문자열 ‘1234’를 기록
    data = [NSData dataWithBytes:"1234"
                          length:4];
    [fileHandle writeData:data];
    
    // 캐시와 디스크 상의 파일을 동기화
    [fileHandle synchronizeFile];
    
    // 파일을 닫음
    [fileHandle closeFile];
    
    [pool drain];
    return 0;
}
