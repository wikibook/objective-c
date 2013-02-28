#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열을 생성 
    NSMutableArray *theArray;
    theArray = [NSMutableArray arrayWithObjects:
                @"value1", @"value2", @"value3", nil];
    
    NSLog(@"%@", theArray);
    
    // 오브젝트를 치환 
    [theArray replaceObjectAtIndex:0
                        withObject:@"newValue1"];
	
    NSLog(@"%@", theArray);
    [pool drain];
    return 0;
}
