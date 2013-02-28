#import "MyObject.h"

@implementation MyObject

- (id)init
{
    self = [super init];
    if (self)
    {
        _counter = 0;  // 카운터를 초기화
    }
    return self;
}

- (void)countWithTimer:(NSTimer *)timer
{
    _counter++;
    NSLog(@"%ld", (long)_counter);
    
    // 시작한지 10초 이상 경과하면 실행 플래그를 OFF로 변경 
    // 시작 시간은 ‘timer’에서 타이머 생성시에 설정
    // 여기에서는 ‘userInfo’에 시작 시간 오브젝트를 전달
    NSDate *startDate = [timer userInfo];
    NSTimeInterval timeInterval;
    
    timeInterval = [[NSDate date] timeIntervalSinceDate:startDate];
    if (timeInterval >= 10)
    {
        // 타이머를 삭제
        [timer invalidate];
    }
}

@end
