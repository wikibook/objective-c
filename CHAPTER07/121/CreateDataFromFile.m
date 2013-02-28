#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 파일 경로를 지정해 데이터 생성
    // 아래 파일경로는 알맞게 변경해주세요 (파일의 위치 및 파일명)
    // 여기에서는 ‘/Users/gaheeyoon/Test.txt’ 파일을 읽어들이고 있음
    NSData *data;
    data = [NSData dataWithContentsOfFile:@"/Users/gaheeyoon/Test.txt"];
    
    NSLog(@"%@", data);
    
    [pool drain];
    return 0;
}
