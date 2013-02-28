#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 연결할 문자열을 생성 
    NSString *str1 = [NSString stringWithString:@"1st"];
    NSString *str2 = [NSString stringWithString:@"2nd"];
    
    // 문자열을 연결
    // ‘str1’에 ‘,’를 연결한 문자열을 생성하고 생성한 문자열에 ‘str2’를 연결 
    // ‘str1’에 ‘,’를 연결한 문자열은 자동으로 소멸되므로
    // 이 코드와 같이 반환값을 그대로 리시버로 사용할 수 있음
    NSString *str;
    str = [[str1 stringByAppendingString:@","]
           stringByAppendingString:str2];
    
    NSLog(@"%@", str);
    [pool drain];
    return 0;
}
