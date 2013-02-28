#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 삽입할 문자열 생성
    NSString *str1 = [NSString stringWithString:@"1st"];
    NSString *str2 = [NSString stringWithString:@"2nd"];
    
    // 문자열 삽입
    // 삽입할 장소는 파라미터 ‘atIndex’로 지정
    // 파라미터 ‘atIndex’는 첫 문자가 0부터 시작됨
    // 가변 문자열의 선두에 문자열을 삽입
    NSMutableString *str = [NSMutableString stringWithCapacity:0];
    [str insertString:str1 atIndex:0];
    [str insertString:@"," atIndex:0];
    [str insertString:str2 atIndex:0];
    
    NSLog(@"%@", str);
    
    [pool drain];
    return 0;
}
