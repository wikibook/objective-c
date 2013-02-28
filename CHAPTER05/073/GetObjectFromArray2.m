#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 배열을 생성
    NSArray *theArray;
    theArray = [NSArray arrayWithObjects:
                @"Value1", @"Value2", @"Value3", nil];

    // 취득할 오브젝트의 인덱스 번호를 인덱스세트에서 지정
    NSIndexSet *indexes = [NSIndexSet indexSetWithIndexesInRange:
                           NSMakeRange(1, 2)];
    NSArray *newArray = [theArray objectsAtIndexes:indexes];
    
    NSLog(@"%@", newArray);
    [pool drain];
    return 0;
}