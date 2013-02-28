#import "MyObject.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 타이머 생성
    // 여기에서는 0.5초 마다 10부터 0까지 카운트하는 타이머를 생성
    MyObject *obj = [[[MyObject alloc] init] autorelease];
    
    // 타이머에서 호출할 메서드를 준비 
    NSString *prefixString = @"THE COUNT";
    SEL sel = @selector(countWithTimer:prefixString:);
    NSInvocation *invocation;
    
    invocation = [NSInvocation invocationWithMethodSignature:
                  [obj methodSignatureForSelector:sel]];
    [invocation setTarget:obj];
    [invocation setSelector:sel];
    [invocation setArgument:&prefixString atIndex:3];
    
    // 타이머 설치
    NSTimer *timer;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                         invocation:invocation
                                            repeats:YES];
    
    // ‘NSInvocation’ 클래스를 경유해서 타이머 메서드를 호출할 때는 
    // ‘NSTimer’ 클래스의 인스턴스도 명시적으로 전달할 필요가 있음
    // ‘NSTimer’ 클래스의 인스턴스가 필요 없을 때는 전달할 필요가 없음
    [invocation setArgument:&timer
                    atIndex:2];
    
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
