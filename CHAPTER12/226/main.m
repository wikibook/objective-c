#import <Foundation/Foundation.h>
#import "MyThreadObject.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    srandomdev();
    
    // 인스턴스를 생성
    MyThreadObject *obj = [[[MyThreadObject alloc] init] autorelease];
    
    // 큐를 생성
    NSOperationQueue *opQueue;
    
    opQueue = [[[NSOperationQueue alloc] init] autorelease];
    
    // 오퍼레이션을 다섯개 생성
    NSInteger i;
    
    for (i = 0; i < 5; i++)
    {
        //오퍼레이션을 생성
        NSOperation *op;
        NSString *name;
        
        name = [NSString stringWithFormat:@"Task %ld", (long)i];
        op = [[[NSInvocationOperation alloc]
               initWithTarget:obj
                     selector:@selector(calc:)
                       object:name] autorelease];
        
        //큐에 등록
        [opQueue addOperation:op];
    }
    
    // 완료될 때까지 대기
    [opQueue waitUntilAllOperationsAreFinished];
    
    [pool drain];
    return 0;
}
