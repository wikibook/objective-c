#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 해석할 문자열 생성
    NSString *srcStr = [NSString stringWithString:
        @"The objective-c is a one of the programming language."];
    
    // 특정 문자로 문자열을 분할
    // 여기에서는 스페이스를 설정하고 있음
    NSArray *tokens = [srcStr componentsSeparatedByString:@" "];
    NSString *str;
    for (str in tokens)
    {
        NSLog(@"%@", str);
    }
    
    [pool drain];
    return 0;
}
