#import "MyOperation.h"

@implementation MyOperation

// 오퍼레이션을 실행할 메서드
- (void)main
{
    // 실행되는 도중에는 증가 처리를 지속
    NSInteger i = 0;
    
    while (![self isCancelled])
    {
        i++;
    }
    
    // 로그에 출력
    NSLog(@"%ld", (long)i);
}

@end
