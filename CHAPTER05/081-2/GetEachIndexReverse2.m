#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 인덱스세트 생성
    NSIndexSet *indexSet;
    indexSet = [NSIndexSet indexSetWithIndexesInRange:
                NSMakeRange(1, 5)];
    
    // 블록을 사용해서 인덱스번호를 취득 
    [indexSet enumerateIndexesWithOptions:NSEnumerationReverse
                               usingBlock:
     ^(NSUInteger idx, BOOL *stop) {
         NSLog(@"%lu", (unsigned long)idx);
     }];
    
    [pool drain];
    return 0;
}
