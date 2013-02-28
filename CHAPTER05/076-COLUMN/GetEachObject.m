#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열을 생성
    NSMutableArray *theArray = [NSMutableArray arrayWithObjects:
                         @"2", @"4", @"5", @"7", @"8", nil];
    NSMutableArray *removeObjects = [NSMutableArray array];
    
    // 배열의 열거자를 취득 
    NSEnumerator *enumerator = [theArray objectEnumerator];
    id value;

    // 배열에서 오브젝트를 순서대로 취득하고 삭제할 오브젝트를 따로 배열로 저장
    while (value = [enumerator nextObject])
    {
        if ([value intValue] % 2 == 0)
            [removeObjects addObject:value];
    }
    [theArray removeObjectsInArray:removeObjects];
    
    NSLog(@"%@", theArray);
    [pool drain];
    return 0;
}
