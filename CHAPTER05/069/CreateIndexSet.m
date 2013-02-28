#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSIndexSet *theIndexSet;

    // 빈 인덱스세트 생성
    theIndexSet = [NSIndexSet indexSet];
    
    NSLog(@"%@", theIndexSet);
    
    // 인덱스 번호를 한 개만 포함한 인덱스세트 생성
    theIndexSet = [NSIndexSet indexSetWithIndex:10];
    
    NSLog(@"%@", theIndexSet);
    
    // 인덱스 번호의 범위를 지정해서 인덱스세트 생성
    // 범위가 지정되므로 연속되지 않은 번호는 지정할 수 없음
    theIndexSet = [NSIndexSet indexSetWithIndexesInRange:
                   NSMakeRange(10, 3)];
    
    NSLog(@"%@", theIndexSet);

    [pool drain];
    return 0;
}
