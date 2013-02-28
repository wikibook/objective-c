#import "MyThreadObserver.h"

@implementation MyThreadObserver

- (id)init
{
    self = [super init];
    if (self)
    {
        // 쓰레드의 중단을 통지 받도록 등록
        NSNotificationCenter *center;
        
        center = [NSNotificationCenter defaultCenter];
        [center addObserver:self
                   selector:@selector(threadWillExitNotification:)
                       name:NSThreadWillExitNotification
                     object:nil];
    }
    return self;
}

- (void)dealloc
{
    // 통지센터에서 삭제
    NSNotificationCenter *center;
    
    center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
    
    [super dealloc];
}

// 통지를 받았을 때 호출하는 메서드
- (void)threadWillExitNotification:(NSNotification *)aNotification
{
    NSLog(@"thread will exit");
}

@end
