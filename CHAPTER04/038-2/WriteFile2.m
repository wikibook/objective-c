#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 문자열 생성
    NSString *str = [NSString stringWithString:@"The String"];
    
    // 문자열 인코딩
    // 여기에서는 UTF8로 인코딩
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    // 작성한 데이터를 파일에 씀
    // 이미 파일이 있을 때는 덮어씀
    // 아래 파일경로는 알맞게 변경해주세요 (파일의 위치 및 파일명)
    BOOL b;
    b = [data writeToFile:@"/Users/gaheeyoon/Test.txt"
               atomically:YES];

    NSLog(@"Successed : %d", b);
    
    [pool release];
    return 0;
}
