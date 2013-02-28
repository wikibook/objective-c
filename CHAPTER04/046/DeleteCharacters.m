#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 원본 문자열 생성
    NSMutableString *str =
        [NSMutableString stringWithString:@"1st, 2nd, 3rd"];
    
    // ‘2nd,’를 삭제
    // 삭제할 범위는 파라미터로 지정
    // ‘2nd,’는 인덱스 번호 4부터 다섯 글자이므로 다음과 같이 지정
    [str deleteCharactersInRange:NSMakeRange(4, 5)];
    
    NSLog(@"%@", str);
    
    [pool drain];
    return 0;
}
