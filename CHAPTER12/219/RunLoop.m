#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 현재의 런루프를 취득
    NSRunLoop   *runLoop = [NSRunLoop currentRunLoop];
    NSDate      *startDate = [NSDate date];
    BOOL        isContinue = YES;
    
    NSLog(@"start : %@", startDate);
    
    while (isContinue)
    {
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        
        // 1초간 런루프를 실행
        [runLoop runUntilDate:
            [NSDate dateWithTimeIntervalSinceNow:1]];
        
        // 만약, 5초 이상 경과했다면 종료
        if ([[NSDate date] timeIntervalSinceDate:startDate] > 5)
        {
            isContinue = NO;
        }
        
        [pool drain];
    }
    
    NSLog(@"end   : %@", [NSDate date]);
    
    [pool drain];
    return 0;
}
