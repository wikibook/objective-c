#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 읽기용 파일핸들을 취득
    // 아래 파일경로는 알맞게 변경해주세요 (파일의 위치 및 파일명)
    // 여기에서는 ‘/Users/gaheeyoon/Test.txt’에서 읽어옴
    NSFileHandle *fileHandle;
    
    fileHandle = [NSFileHandle fileHandleForReadingAtPath:
                  @"/Users/gaheeyoon/Test.txt"];
    
    // 파일이 없을 때 변수 ‘fileHandle’은 ‘nil’이 됨
    if (fileHandle)
    {
        // 파일에서 4바이트를 읽어옴
        NSData *data;
        data = [fileHandle readDataOfLength:4];
        
        // 읽어온 데이터로 문자열을 생성해 로그에 출력
        NSString *str;
        str = [[[NSString alloc] initWithData:data
                                     encoding:NSUTF8StringEncoding]
               autorelease];
        NSLog(@"%@", str);
    }
    
    [pool drain];
    return 0;
}
