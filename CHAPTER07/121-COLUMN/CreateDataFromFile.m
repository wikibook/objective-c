#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // URL을 지정해 데이터 생성
    // 아래 파일경로는 알맞게 변경해주세요 (파일의 위치 및 파일명)
    // 여기에서는 ‘/Users/gaheeyoon/Test.txt’를 읽어들임
    // 인터넷상의 URL을 지정할 때는 ‘URLWithString:’ 메서드를 사용
    NSURL *url = [NSURL fileURLWithPath:@"/Users/gaheeyoon/Test.txt"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSLog(@"%@", data);
    
    [pool drain];
    return 0;
}
