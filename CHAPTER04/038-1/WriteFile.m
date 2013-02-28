#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 문자열 생성
    NSString *str = [NSString stringWithString:@"The String"];
    
    // 파일 경로를 지정해서 파일을 읽어옴 
    // 이미 파일이 있을 때는 덮어씀
    // 아래 파일경로는 알맞게 변경해주세요 (파일의 위치 및 파일명)
    BOOL b;
    b = [str writeToFile:@"/Users/gaheeyoon/Test.txt"
              atomically:YES
                encoding:NSUTF8StringEncoding
                   error:NULL];
    NSLog(@"Successed : %d", b);

    [pool drain];
    return 0;
}
