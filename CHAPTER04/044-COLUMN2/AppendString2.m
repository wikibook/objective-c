#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 연결할 문자열을 생성
    NSString *str1 = [NSString stringWithString:@"1st"];
    NSString *str2 = [NSString stringWithString:@"2nd"];
    
    // 문자열을 연결
    // ‘str1’ ‘,’ ‘str2’의 순으로 문자열을 연결
    NSMutableString *str = [NSMutableString stringWithCapacity:0];
    
    [str appendString:str1];
    [str appendString:@","];
    [str appendString:str2];
    
    NSLog(@"%@", str);
    
    // 포맷이 설정된 문자열을 연결
    str = [NSMutableString stringWithCapacity:0];
    [str appendFormat:@"%@,%@", str1, str2];

    NSLog(@"%@", str);
    
    [pool drain];
    return 0;
}
