#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *str;
    
    // 파일 경로를 지정해 문자열을 읽어옴
    // 아래 파일경로는 알맞게 변경해주세요 (파일의 위치 및 파일명)
    str = [NSString stringWithContentsOfFile:@"/Users/gaheeyoon/Test.txt"
                                    encoding:NSUTF8StringEncoding
                                       error:NULL];
    NSLog(@"%@", str);
    [pool drain];
    return 0;
}
