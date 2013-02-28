#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열을 생성 
    NSArray *theArray;
    theArray = [NSArray arrayWithObjects:
                @"value1", @"value2", nil];
    NSArray *theArray2;
    theArray2 = [NSArray arrayWithObjects:
                 @"value3", @"value4", nil];
    
    // 배열을 결합해 새로운 배열을 만든다 
    NSArray *newArray;
    newArray = [theArray arrayByAddingObjectsFromArray:theArray2];
    
    NSLog(@"%@", newArray);
    [pool drain];
    return 0;
}
