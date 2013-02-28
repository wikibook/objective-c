#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 원본 배열 생성
    NSArray *srcArray = [NSArray arrayWithObjects:
                         @"A", @"B", @"C", nil];
    
    // 배열을 복제함
    NSArray *theArray = [NSArray arrayWithArray:srcArray];
    
    NSLog(@"%@", theArray);
    
    [pool drain];
    return 0;
}
