#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열을 생성 
    NSMutableArray *theArray;
    theArray = [NSMutableArray arrayWithObjects:
                @"value1", @"value2", nil];
    NSArray *theArray2;
    theArray2 = [NSArray arrayWithObjects:
                 @"value3", @"value4", nil];

    // ‘NSMutableArray’ 클래스는 배열에 직접 결합할 수 있음
    [theArray addObjectsFromArray:theArray2];
    
    NSLog(@"%@", theArray);
    [pool drain];
    return 0;
}
