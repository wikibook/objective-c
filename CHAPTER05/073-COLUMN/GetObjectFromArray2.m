#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 배열 생성
    NSArray *theArray;
    theArray = [NSArray arrayWithObjects:
                @"Value1", @"Value2", @"Value3", nil];

    // 취득하고자 하는 오브젝트의 범위를 지정 
    NSArray *newArray;
    newArray = [theArray subarrayWithRange:NSMakeRange(1, 2)];
    
    NSLog(@"%@", newArray);
    [pool drain];
    return 0;
}