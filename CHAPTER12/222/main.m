#import "MyObject.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 타이머를 생성
    // 여기에서는 0.5초마다 카운트하는 타이머를 생성
    MyObject *obj = [[[MyObject alloc] init] autorelease];
    
    // 타이머를 설치
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:obj
                                   selector:@selector(countWithTimer:)
                                   userInfo:[NSDate date]  // 시작시간 
                                    repeats:YES];
    
    // 런루프를 실행
    // 여기에서는 런루프를 20초 간 실행
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:20]];
    
    [pool drain];
    return 0;
}
