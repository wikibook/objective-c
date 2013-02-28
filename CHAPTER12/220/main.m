#import <Foundation/Foundation.h>
#import "MyObject.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 타이머 생성
    // 여기에서는 0.5초 마다 10부터 0까지 카운트하는 타이머를 생성
    MyObject *obj = [[[MyObject alloc] init] autorelease];
    
    // 타이머 설치
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:obj
                                   selector:@selector(countWithTimer:)
                                   userInfo:nil
                                    repeats:YES];
    
    // 런루프 실행 
    BOOL isContinue = YES;
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    
    while (isContinue)
    {
        NSAutoreleasePool *subPool = [[NSAutoreleasePool alloc] init];
        
        // 1초간 실행 
        [runLoop runUntilDate:
            [NSDate dateWithTimeIntervalSinceNow:1]];
        
        // 카운터의 값을 취득해 0이 되면 종료 
        if ([obj counter] == 0)
        {
            isContinue = NO;
        }
        
        [subPool drain];
    }
    
    [pool drain];
    return 0;
}
