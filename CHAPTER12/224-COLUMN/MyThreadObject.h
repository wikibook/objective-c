#import <Foundation/Foundation.h>

// 作成したスレッドで実行するメソッドを持つクラスを定義する
@interface MyThreadObject : NSObject
{
    NSConditionLock *_conditionLock;
}

- (void)stopThread;
- (void)threadProc:(id)anArgument;

@end