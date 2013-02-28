#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열을 생성 
    NSMutableArray *theArray;
    theArray = [NSMutableArray arrayWithObjects:
                @"value1", @"value2", @"value3", nil];
    
    NSLog(@"%@", theArray);
    
    // 여러 개의 오브젝트를 치환
    // 치환할 오브젝트의 위치를 인덱스세트로 지정함
    // 치환될 오브젝트를 배열로 지정
    NSIndexSet *indexSet;
    indexSet = [NSIndexSet indexSetWithIndexesInRange:
                NSMakeRange(1, 2)];
    
    NSArray* newValues;
    newValues = [NSArray arrayWithObjects:
                 @"newValue2", @"newValue3", nil];
    
    [theArray replaceObjectsAtIndexes:indexSet
                          withObjects:newValues];
    
    NSLog(@"%@", theArray);
    [pool drain];
    return 0;
}
