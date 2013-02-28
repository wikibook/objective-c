#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *str;
    
    // URL을 지정해 문자열을 읽어들임
    // 로컬 파일의 URL을 지정
    // 인터넷상의 URL을 지정할 때는 ‘URLWithString:’ 메서드 사용
    // 아래 파일경로는 알맞게 변경해주세요 (파일의 위치 및 파일명)
    NSURL *url = [NSURL fileURLWithPath:@"/Users/gaheeyoon/Test.txt"];
    str = [NSString stringWithContentsOfURL:url
                                   encoding:NSUTF8StringEncoding
                                      error:NULL];
    NSLog(@"%@", str);
    [pool drain];
    return 0;
}
