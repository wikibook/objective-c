#import <Foundation/Foundation.h>

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
        
        op = [NSBlockOperation blockOperationWithBlock:^{
            // 처리를 블록 구문으로 기술
            long value = random();
            
            // 난수로 발생시킨 값을 인수분해
            NSMutableArray *factors;

            factors = [NSMutableArray arrayWithCapacity:0];
            
            long curValue = value;
            long l = 2;
            
            while (l < curValue)
            {
                // 나머지가 없다면 인수
                if (curValue % l == 0)
                {
                    [factors addObject:[NSNumber numberWithLong:l]];
                    curValue /= l;
                    l = 2;
                }
                else
                {
                    l++;
                }
                
            }
            
            if (curValue != 1)
            {
                [factors addObject:
                 [NSNumber numberWithLong:curValue]];
            }
            
            // 값과 이름을 로그에 출력
            NSLog(@"%@: %ld=%@",
                  name, value, factors);
        }];
        
        // 큐에 등록
        [opQueue addOperation:op];
    }
    
    // 완료할 때까지 대기
    [opQueue waitUntilAllOperationsAreFinished];
    
    [pool drain];
    return 0;
}
