#import <Foundation/Foundation.h>

// 쓰레드의 중단을 통지 받는 클래스를 정의
@interface MyThreadObserver : NSObject
{
}
- (void)threadWillExitNotification:(NSNotification *)aNotification;
@end
