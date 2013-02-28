#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 인덱스세트를 생성 
    NSIndexSet *indexSet;
    indexSet = [NSIndexSet indexSetWithIndexesInRange:
                NSMakeRange(1, 3)];
    
    // 조사할 인덱스번호를 인덱스세트에 지정 
    NSIndexSet *checkIndexSet;
    checkIndexSet= [NSIndexSet indexSetWithIndex:3];
    BOOL b = [indexSet containsIndexes:checkIndexSet];
    NSLog(@"Contains '3' : %d", b);
    
    checkIndexSet = [NSIndexSet indexSetWithIndexesInRange:
                     NSMakeRange(0, 2)];
    b = [indexSet containsIndexes:checkIndexSet];
    NSLog(@"Contains '0' and '1' : %d", b);
    
    [pool drain];
    return 0;
}
