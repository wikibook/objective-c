#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 인덱스세트를 생성
    NSIndexSet *indexSet;
    indexSet = [NSIndexSet indexSetWithIndexesInRange:
                NSMakeRange(1, 5)];
    
    // 인덱스세트에서 가장 작은 인덱스 번호를 취득 
    // 인덱스 번호가 한 개도 없는 때는
    // ‘NSNotFound’를 반환
    NSUInteger u;
    u = [indexSet firstIndex];
    
    // 'NSNotFound'가 반환될 때까지 반복 
    while (u != NSNotFound)
    {
        NSLog(@"%lu", (unsigned long)u);
        
        // 다음 인덱스 번호를 취득
        // 다음 인덱스번호는 이 번호보다 큰 인덱스번호가 됨
        // 변수 ‘u’보다 큰 인덱스 번호가 없으면 ‘NSNotFound’를 반환
        u = [indexSet indexGreaterThanIndex:u];
    }
    
    [pool drain];
    return 0;
}
