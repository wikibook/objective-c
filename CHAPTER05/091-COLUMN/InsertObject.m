#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 가변 배열을 생성 
    NSMutableArray *theArray;
    theArray = [NSMutableArray arrayWithObject:@"value"];
    
    // 여러 개의 오브젝트 삽입하기
    // 삽입할 오브젝트를 배열로 지정하고
    // 인덱스세트에서 삽입할 곳의 인덱스번호를 지정
    // 여기에서는 두 개의 오브젝트를 인덱스 번호 1의 위치에 삽입하고 있음
    NSIndexSet *indexes;
    indexes = [NSIndexSet indexSetWithIndexesInRange:
               NSMakeRange(0, 2)];
    
    NSArray *insertedObjects;
    insertedObjects = [NSArray arrayWithObjects:
                       @"value3", @"value4", nil];
    
    [theArray insertObjects:insertedObjects
                  atIndexes:indexes];
    
    NSLog(@"%@", theArray);
    [pool drain];
    return 0;
}
