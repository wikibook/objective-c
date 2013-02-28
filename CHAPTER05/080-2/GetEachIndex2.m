#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 인덱스세트 생성
    NSIndexSet *indexSet;
    indexSet = [NSIndexSet indexSetWithIndexesInRange:
                NSMakeRange(1, 5)];

    // 블록을 사용해 인덱스 번호를 취득 
    [indexSet enumerateIndexesUsingBlock:
     ^(NSUInteger idx, BOOL *stop) {
         NSLog(@"%lu", (unsigned long)idx);
     }];
    
    [pool drain];
    return 0;
}