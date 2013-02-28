#import <Foundation/Foundation.h>
#import "MyObject.h"

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 인스턴스 생성
    MyObject *obj = [[[MyObject alloc] init] autorelease];
    
    // 셀렉터 취득 
    SEL sel = @selector(logNow:);
    
    // 5초 후에 호출 
    [obj performSelector:sel
              withObject:nil
              afterDelay:5];
    
    NSDate *startDate = [NSDate date];
    NSLog(@"%@", startDate);

    // 런루프를 실행
    // 일반적인 애플리케이션에서는 ‘NSApplicationMain’ 함수나
    // ‘UIApplicationMain’ 함수가 런루프를 실행함
    // 여기에서는 지연해서 5초 후에 동작하는 메서드가 있으므로
    // 메서드까지 동작시키기 위해 타임아웃을 7초로 설정
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:7]];
        
    [pool drain];
    return 0;
}
