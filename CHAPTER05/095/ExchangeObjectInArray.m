#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열을 생성 
    NSMutableArray *theArray;
    theArray = [NSMutableArray arrayWithObjects:
                @"value1", @"value2", @"value3", nil];
    
    NSLog(@"%@", theArray);
    
    // 오브젝트를 교체
    // 여기에서는 최초의 오브젝트와 마지막 오브젝트를 교체
    [theArray exchangeObjectAtIndex:0
                  withObjectAtIndex:2];
    NSLog(@"%@", theArray);
    
    [pool drain];
    return 0;
}
