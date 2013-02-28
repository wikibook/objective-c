#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 배열을 생성
    NSArray *theArray;
    theArray = [NSArray arrayWithObjects:
                [NSNumber numberWithInteger:5],
                [NSNumber numberWithInteger:9],
                [NSNumber numberWithInteger:12],
                [NSNumber numberWithInteger:16],
                [NSNumber numberWithInteger:20],
                nil];
    
    // 블록에서 사용할 상한값과 하한값
    const NSInteger MIN_VALUE = 10;
    const NSInteger MAX_VALUE = 19;
    
    // 검색할 오브젝트의 조건을 기술해서 검색 
    // 여기에서는 10 이상 20 미만의 정수를 검색
    NSUInteger u;
    u = [theArray indexOfObjectPassingTest:
         ^(id obj, NSUInteger idx, BOOL *stop) {
             // 파라미터 ‘obj’를 판단함
             // 검색대상 오브젝트라면 ‘YES’ 그렇지 않으면 ‘NO’를 반환
             if ([obj integerValue] >= MIN_VALUE &&
                 [obj integerValue] <= MAX_VALUE)
             {
                 return YES;
             }
             return NO;
         }];
    
    NSLog(@"Found: %lu", (unsigned long)u);
    
    // 뒤에서부터 검색
    u = [theArray indexOfObjectWithOptions:NSEnumerationReverse
                               passingTest:
         ^(id obj, NSUInteger idx, BOOL *stop) {
             // 파라미터 ‘obj’를 판단함
             // 검색대상 오브젝트라면 ‘YES’ 그렇지 않다면 ‘NO’를 반환
             if ([obj integerValue] >= MIN_VALUE &&
                 [obj integerValue] <= MAX_VALUE)
             {
                 return YES;
             }
             return NO;
         }];
    
    NSLog(@"Found: %lu", (unsigned long)u);
    
    // 여러 개의 오브젝트를 동시에 검색
    NSIndexSet *indexSet;
    indexSet = [theArray indexesOfObjectsPassingTest:
                ^(id obj, NSUInteger idx, BOOL *stop) {
                    // 파라미터 ‘obj’를 판단함
                    // 검색대상 오브젝트라면 ‘YES’ 그렇지 않으면 ‘NO’를 반환
                    if ([obj integerValue] >= MIN_VALUE &&
                        [obj integerValue] <= MAX_VALUE)
                    {
                        return YES;
                    }
                    return NO;
                }];
    
    NSLog(@"Found: %@", indexSet);
    
    // 검색할 범위를 지정 
    NSIndexSet *rangeIndexSet;
    rangeIndexSet = [NSIndexSet indexSetWithIndexesInRange:
                     NSMakeRange(3, 2)];
    indexSet = [theArray indexesOfObjectsAtIndexes:rangeIndexSet
                                           options:0
                                       passingTest:
                ^(id obj, NSUInteger idx, BOOL *stop) {
                    // 파라미터 ‘obj’를 판단함
                    // 검색대상 오브젝트라면 ‘YES’ 그렇지 않다면 ‘NO’를 반환
                    if ([obj integerValue] >= MIN_VALUE &&
                        [obj integerValue] <= MAX_VALUE)
                    {
                        return YES;
                    }
                    return NO;
                }];
    NSLog(@"Found: %@", indexSet);
    
    [pool drain];
    return 0;
}
