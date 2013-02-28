#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 원본 문자열 생성
    NSString *srcStr = [NSString stringWithString:@"  The string \t"];
    
    // 공백 문자와 라인 피드 문자 삭제 
    NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];    
    NSString *newStr = [srcStr stringByTrimmingCharactersInSet:charSet];
    
    // 로그에 출력
    NSLog(@"Source String : \"%@\"", srcStr);
    NSLog(@"Trimmed String: \"%@\"", newStr);
    
    [pool drain];
    return 0;
}
