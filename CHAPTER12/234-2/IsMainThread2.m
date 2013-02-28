#import <Foundation/Foundation.h>

// 메인 쓰레드를 저장하는 변수
static NSThread *sMainThread = nil;

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // 프로그램 실행 직전에 현재 쓰레드를 취득 
    // 메인 함수는 메인 쓰레드 상에서 실행되므로 
    // 여기서 취득한 쓰레드가 메인 쓰레드가 됨
    sMainThread = [NSThread currentThread];
    
    // 메인 쓰레드인지 판정하고 싶은 곳에서 보유하고 있는
    // 변수 ‘sMainThread’와 비교해 판정
    // 서브쓰레드상에서 ‘currentThread’ 메서드를 사용하면
    // 변수 ‘sMainThread’와는 다른 인스턴스를 취득 할 수 있음 
    //
    // 이 함수는 메인 쓰레드상에서 동작하며 위에서 취득한 인스턴스와
    // 같은 인스턴스를 취득 할 수 있음
    if ([NSThread currentThread] == sMainThread)
    {
        NSLog(@"Current thread is main thread");
    }
    else
    {
        NSLog(@"Current thread is sub-thread");
    }
    
    [pool release];
    return 0;
}
