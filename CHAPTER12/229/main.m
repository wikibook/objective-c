#import <Foundation/Foundation.h>
#import "MyOperation.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 큐를 생성
    NSOperationQueue *opQueue;
    
    opQueue = [[[NSOperationQueue alloc] init] autorelease];
    
    // 오퍼레이션을 두 개 생성
    NSInteger i;
    for (i = 0; i < 2; i++)
    {
        NSOperation *op;
        
        op = [[[MyOperation alloc] init] autorelease];
        
        // 큐에 등록
        [opQueue addOperation:op];
    }
    
    // 3초간 슬립
    [NSThread sleepUntilDate:
     [NSDate dateWithTimeIntervalSinceNow:3]];
    
    // 큐를 취소
    // 이 메서드는 취소 완료까지 대기하지 않음
    [opQueue cancelAllOperations];
    
    // 3초간 슬립
    [NSThread sleepUntilDate:
     [NSDate dateWithTimeIntervalSinceNow:3]];
    
    [pool drain];
    return 0;
}
