#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열을 생성 
    NSMutableArray *array;
    array = [NSMutableArray arrayWithObjects:
             @"value1", @"value2", @"value3", nil];

    NSLog(@"array=%@", array);

    // 여러 개의 오브젝트를 한번에 삭제 
    NSArray *array2 = [NSArray arrayWithObjects:
                       @"value1", @"value3", nil];
    [array removeObjectsInArray:array2];
    
    NSLog(@"array=%@", array);
    [pool drain];
    return 0;
}
