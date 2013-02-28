#import <Foundation/Foundation.h>

// 생성될 쓰레드에서 실행할 메서드를 갖는 클래스를 정의
@interface MyThreadObject : NSObject
{
}
- (void)threadProc:(id)anArgument;
@end
