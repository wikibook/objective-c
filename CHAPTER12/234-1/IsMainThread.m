#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 메인쓰레드인지 판정
    if ([NSThread isMainThread])
    {
        NSLog(@"Current thread is main thread");
    }
    else
    {
        NSLog(@"Current thread is sub-thread");
    }
    
    [pool drain];
    return 0;
}
