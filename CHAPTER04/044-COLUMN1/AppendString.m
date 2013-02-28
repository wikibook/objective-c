#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 연결할 문자열을 생성 
    NSString *str1 = [NSString stringWithString:@"1st"];
    NSString *str2 = [NSString stringWithString:@"2nd"];
    
    // 포맷이 설정된 문자열을 연결 
    NSString *str;
    str = [str1 stringByAppendingFormat:@",%@", str2];
    
    NSLog(@"%@", str);
    [pool drain];
    return 0;
}
