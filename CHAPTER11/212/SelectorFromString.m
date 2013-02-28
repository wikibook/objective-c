#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 문자열에서 셀렉터 취득
    SEL sel = NSSelectorFromString(@"description");
    
    // 셀렉터를 비교해 취득됐는지 확인
    if (sel == @selector(description))
    {
        NSLog(@"description");
    }
    else
    {
        NSLog(@"Unknown");
    }
    
    [pool drain];
    return 0;
}
