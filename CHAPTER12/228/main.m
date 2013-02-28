#import <Foundation/Foundation.h>
#import "MyOperation.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    srandomdev();
    
    // 큐를 생성
    NSOperationQueue *opQueue;
    
    opQueue = [[[NSOperationQueue alloc] init] autorelease];
    
    // 오퍼레이션을 다섯개 생성
    NSInteger i;
    
    for (i = 0; i < 5; i++)
    {
        // 오퍼레이션을 생성
        NSOperation *op;
        NSString *name;
        
        name = [NSString stringWithFormat:@"Task %ld", (long)i];
        op = [[[MyOperation alloc] initWithName:name] autorelease];
        
        // 큐에 등록
        [opQueue addOperation:op];
    }
    
    // 완료할 때까지 대기
    [opQueue waitUntilAllOperationsAreFinished];
    
    [pool drain];
    return 0;
}
