#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 원본 문자열 생성
    NSString *srcStr = [NSString stringWithString:@"There are 3 mails."];
    
    // 처음 다섯 문자로 새로운 문자열 생성
    NSString *str;
    str = [srcStr substringToIndex:5];
    NSLog(@"%@", str);  // 로그에 출력
    
    // 마지막 여섯 문자로 새로운 문자열 생성 
    str = [srcStr substringFromIndex:[srcStr length] - 6];
    NSLog(@"%@", str);
    
    // 범위를 지정해서 부분 문자열을 취득
    NSRange range = NSMakeRange(6, 3); // 생성할 문자열의 범위
    str = [srcStr substringWithRange:range];
    NSLog(@"%@", str);
    
    [pool drain];
    return 0;
}
