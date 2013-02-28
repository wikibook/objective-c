#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 기준이 될 URL을 생성
    NSURL *baseURL = [NSURL fileURLWithPath:
                      @"/Data/Images/Sample.jpg"];
    
    NSLog(@"baseURL = %@", baseURL);
    
    // 상위 디렉터리 URL 생성
    // 여기에서는 ‘../Sample.txt’를 지정
    NSURL *fileURL = [NSURL URLWithString:@"../Sample.txt"
                            relativeToURL:baseURL];
    
    NSLog(@"fileURL = %@", fileURL);
    
    // 정규화
    // 정규화하기 위해 절대 URL로 변환
    fileURL = [[fileURL absoluteURL] standardizedURL];
    
    NSLog(@"fileURL = %@", fileURL);
    
    [pool drain];
    return 0;
}
