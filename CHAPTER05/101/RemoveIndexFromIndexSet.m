#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 인덱스세트를 생성 
    NSMutableIndexSet *indexSet;
    indexSet = [NSMutableIndexSet indexSetWithIndexesInRange:
                NSMakeRange(0, 10)];
    
    NSLog(@"%@", indexSet);
    
    // 값을 한 개 삭제 
    [indexSet removeIndex:5];
    NSLog(@"%@", indexSet);
    
    [pool drain];
    return 0;
}
