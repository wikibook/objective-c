#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 문자열 생성
    NSString *str = [NSString stringWithString:@"The String"];
    
    // URL을 지정해 파일을 저장
    // 여기에서는 로컬 파일 경로를 지정
    // 아래 파일경로는 알맞게 변경해주세요 (파일의 위치 및 파일명)
	BOOL b;
    NSURL *url = [NSURL fileURLWithPath:@"/Users/gaheeyoon/Test.txt"];
    b = [str writeToURL:url
             atomically:YES
               encoding:NSUTF8StringEncoding
                  error:NULL];
    NSLog(@"Successed : %d", b);

    [pool drain];
    return 0;
}
