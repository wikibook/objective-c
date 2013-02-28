#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 인덱스세트를 생성 
    NSRange range = NSMakeRange(0, 4);
    NSMutableIndexSet *indexSet =
        [NSMutableIndexSet indexSetWithIndexesInRange:range];
    
    // 값을 시프트 함. 2 이상의 인덱스번호를 1씩 시프트 
    [indexSet shiftIndexesStartingAtIndex:2
                                       by:1];
    NSLog(@"%@", indexSet);
    [pool drain];
    return 0;
}
