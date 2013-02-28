#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 인덱스세트를 생성 
    NSMutableIndexSet *indexSet;
    indexSet = [NSMutableIndexSet indexSetWithIndexesInRange:
                NSMakeRange(0, 10)];
    
    NSLog(@"%@", indexSet);
    
    // 다른 인덱스세트에 포함된 값을 삭제 
    NSIndexSet *indexSet2;
    indexSet2 = [NSIndexSet indexSetWithIndexesInRange:
                 NSMakeRange(0, 3)];
    [indexSet removeIndexes:indexSet2];
    NSLog(@"%@", indexSet);
	
    [pool drain];
    return 0;
}
