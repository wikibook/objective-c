#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 원본 문자열 생성
    NSString *str = [NSString stringWithString:@"1st, 2nd, 3rd"];
    
    // ‘2nd,’를 삭제
    // ‘1st,’와 ‘3rd,’ 두 개 문자열로 분할해서 연결    
    NSString *part1 = [str substringToIndex:4];
    NSString *part2 = [str substringFromIndex:9];
    
    str = [part1 stringByAppendingString:part2];
    
    NSLog(@"%@", str);
    [pool drain];
    return 0;
}