#import <Foundation/Foundation.h>

// 생성할 쓰레드에서 실행할 메서드를 갖는 클래스를 정의
@interface MyThreadObject : NSObject
{
    NSConditionLock *_conditionLock;
}
// 상태변수포함 락을 외부에서 설정하기 위한 프로퍼티를 정의
@property(retain) NSConditionLock *conditionLock;

- (void)threadProc:(id)anArgument;
@end
