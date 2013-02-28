#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // 삽입할 문자열 생성
    NSString *str1 = [NSString stringWithString:@"1st 3rd"];
    NSString *str2 = [NSString stringWithString:@"2nd "];
    
    // 문자열 중간에 삽입할 새로운 문자열을 생성
    // 변수 ‘str1’의 ‘3rd'부분을 분할해
    // 변수 ‘str2’를 중간에 삽입한 문자열을 생성
    NSString *part1 = [str1 substringToIndex:4];
    NSString *part2 = [str1 substringFromIndex:4];
    
    // 문자열을 연결 
    NSString *str = [[part1 stringByAppendingString:str2]
                     stringByAppendingString:part2];
    NSLog(@"%@", str);
    [pool drain];
    return 0;
}
