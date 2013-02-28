#import <libkern/OSAtomic.h>
#import "MyObject.h"

static int32_t sCount = 0;

@implementation MyObject

- (void)finalize
{
    // 여기에서는 가비지 컬렉션에 의해 오브젝트가 소멸됐나를 확인하기 위해 
    // 로그를 출력
    // 카운터는 쓰레드 세이프인 함수를 사용해 증가시킴
    int32_t i = OSAtomicIncrement32(&sCount);
    NSLog(@"finalize(%d)", i);
    [super finalize];
}

@end
