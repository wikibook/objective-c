#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열을 생성 
    NSMutableArray *theArray;
    theArray = [NSMutableArray arrayWithObjects:
                @"value1", @"value2", @"value3", nil];
    
    NSLog(@"%@", theArray);
    
    // 범위를 지정해서 오브젝트를 치환 
    NSArray *newValues = [NSArray arrayWithObjects:
                 @"NEW1", @"NEW2", @"NEW3", nil];
    [theArray replaceObjectsInRange:NSMakeRange(0, 3)
               withObjectsFromArray:newValues];
    
    NSLog(@"%@", theArray);
    [pool drain];
    return 0;
}
