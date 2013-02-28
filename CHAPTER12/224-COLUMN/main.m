#import <Foundation/Foundation.h>
#import "MyThreadObject.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // スレッドを作成するためにインスタンスを作成する
    MyThreadObject *obj = [[[MyThreadObject alloc] init] autorelease];
    
    // スレッドを作成する
    [NSThread detachNewThreadSelector:@selector(threadProc:)
                             toTarget:obj
                           withObject:nil];

    // 2秒間待機する
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    
    // スレッドを中断する
    [obj stopThread];
    
    // 2秒間待機する
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    
    [pool drain];
    return 0;
}