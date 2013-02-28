#import <Foundation/Foundation.h>

// 생성될 쓰레드에서 실행할 메서드를 갖는 클래스를 정의
@interface MyThreadObject : NSObject
{
    NSConditionLock *_conditionLock;
    NSInteger       _integerValue;
}
// 상태변수포함 락을 외부에서 설정할 수 있게 프로퍼티를 정의
@property(retain) NSConditionLock *conditionLock;

- (void)threadProc:(id)anArgument;
- (NSInteger)integerValue;
@end
