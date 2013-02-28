#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 문자열 생성
    NSString *str = [NSString stringWithString:@"The string"];
    
    // 문자열 선두부터 순서대로 문자를 취득 
    unsigned int ind;
    for (ind = 0; ind < [str length]; ind++)
    {
        // 문자열에서 문자를 취득
        unichar c = [str characterAtIndex:ind];
        
        // 로그에 출력
        NSLog(@"[%u] = '%C'", ind, c);
    }
    
    [pool drain];
    return 0;
}
