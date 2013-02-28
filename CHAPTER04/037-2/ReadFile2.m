#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *str;
    
    // 파일에서 바이너리 데이터(텍스트 데이터)를 읽어들임
    // 아래 파일경로는 알맞게 변경해주세요 (파일의 위치 및 파일명)
    NSData *data = [NSData dataWithContentsOfFile:@"/Users/gaheeyoon/Test.txt"];
    
    // 바이너리 데이터에서 문자열을 생성
    str = [[NSString alloc] initWithData:data
                                encoding:NSUTF8StringEncoding];
    NSLog(@"%@", str);
    [str release];    
    
    [pool drain];
    return 0;
}
