#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 'square'라는 프로토콜 구문의 변수를 정의
    // 반환형은 'int' 타입, 파라미터로 'int' 타입 하나를 가짐
    int (^square)(int);

    // 'square'의 내용을 블록 구문으로 기술함
    square = ^(int x) {
        return x * x;   // 파라미터 'x'를 제곱하여 반환
    };
    
    for (int i = 0; i < 10; i++)
    {
        // 'squre'에 파라미터 'i'를 전달해서 반환된 값을 로그에 출력
        NSLog(@"%d x %d = %d", i, i, square(i));
    }

    [pool drain];
    return 0;
}
