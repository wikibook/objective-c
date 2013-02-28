#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 인덱스세트 생성 
    NSIndexSet *indexSet;
    indexSet = [NSIndexSet indexSetWithIndexesInRange:
                NSMakeRange(1, 3)];
    
    // 조사할 인덱스번호의 범위를 지정 
    BOOL b = [indexSet containsIndexesInRange:NSMakeRange(2, 2)];
    NSLog(@"Contains '2' and '3' : %d", b);
    
    b = [indexSet containsIndexesInRange:NSMakeRange(0, 2)];
    NSLog(@"Contains '0' and '1' : %d", b);
    
    [pool drain];
    return 0;
}
