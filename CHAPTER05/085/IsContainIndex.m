#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 인덱스세트를 생성 
    NSIndexSet *indexSet;
    indexSet = [NSIndexSet indexSetWithIndexesInRange:
                NSMakeRange(1, 3)];
    
    // 인덱스번호가 인덱스세트에 들어있는지 조사 
    BOOL b;
    b = [indexSet containsIndex:2];
    NSLog(@"Contains '2' : %d", b);
    
    b = [indexSet containsIndex:5];
    NSLog(@"Contains '5' : %d", b);
    
    [pool drain];
    return 0;
}
