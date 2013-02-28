#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 문자열 생성
    NSString *str = [NSString stringWithString:@"ABCDE"];
    // 문자열의 길이를 취득
    unsigned int len = [str length];
    
    NSLog(@"The Length : %u", len);
    
    [pool drain];
    return 0;
}
