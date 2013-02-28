#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 파일 경로에서 ‘NSURL’ 클래스의 인스턴스 생성
    // 여기에서는 로컬 파일 ‘/Data/Sample 1.jpg’를 생성
    NSURL *url = [NSURL fileURLWithPath:@"/Data/Sample 1.jpg"];
    
    NSLog(@"%@", url);
    
    [pool drain];
    return 0;
}
