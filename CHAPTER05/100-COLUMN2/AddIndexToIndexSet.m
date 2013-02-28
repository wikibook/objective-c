#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 빈 인덱스세트를 생성 
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    
    // 다른 인덱스세트의 값을 추가 
    NSIndexSet *indexSet2 = [NSIndexSet indexSetWithIndex:7];
    
    [indexSet addIndexes:indexSet2];
    NSLog(@"%@", indexSet);    
    
    [pool drain];
    return 0;
}
