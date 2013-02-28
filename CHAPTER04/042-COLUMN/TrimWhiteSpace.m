#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 원본 문자열 생성 
    NSString *str1 = [NSString stringWithString:@"    The string"];
    NSString *str2 = [NSString stringWithString:@"\tTheString"];
    
    // 공백 문자와 라인 피드 문자를 삭제할 캐릭터 세트에서
    // 탭을 제외시킨 캐릭터 세트 생성    
    NSMutableCharacterSet *charSet;
    charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    [charSet removeCharactersInString:@"\t"];
    
    str1 = [str1 stringByTrimmingCharactersInSet:charSet];
    str2 = [str2 stringByTrimmingCharactersInSet:charSet];
    
    // 로그에 출력
    NSLog(@"1: \"%@\"", str1);
    NSLog(@"2: \"%@\"", str2);
    
    [pool drain];
    return 0;
}
