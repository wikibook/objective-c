#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 데이터를 생성 
    char bytesBuf[] = {
        'T', 'H', 'E', ' ', 'D', 'A', 'T', 'A'
    };
    
    NSData *data = [NSData dataWithBytes:bytesBuf
                                  length:sizeof(bytesBuf)];
    
    // 파일 경로를 지정해 파일에 기록 
    // 이미 파일이 있을 때는 덮어씀
    // 아래 파일경로는 알맞게 변경해주세요 (파일의 위치 및 파일명)
    // 여기에서는 ‘/Users/gaheeyoon/Test.txt’에 저장
    BOOL b;
    b = [data writeToFile:@"/Users/gaheeyoon/Test.txt"
               atomically:YES];
    NSLog(@"Result : %d", b);

    [pool drain];
    return 0;
}
