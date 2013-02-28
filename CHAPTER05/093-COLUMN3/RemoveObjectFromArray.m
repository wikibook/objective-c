#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열을 생성 
    NSMutableArray *array;
    array = [NSMutableArray arrayWithObjects:
             @"value1", @"value2", @"value3", nil];

    NSLog(@"array=%@", array);

    // 인덱스번호를 지정해서 오브젝트를 삭제 
    [array removeObjectAtIndex:0];   
    
    NSLog(@"array=%@", array);
    [pool drain];
    return 0;
}
