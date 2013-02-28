#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열을 생성
    NSArray *theArray;
    theArray = [NSArray arrayWithObjects:
                @"Value1", @"Value2", @"Value3", nil];
    
    // 검색범위를 한정해서 검색 
    NSUInteger u = [theArray indexOfObject:@"Value1"
                                   inRange:NSMakeRange(1, 2)];
    if (u == NSNotFound)
        NSLog(@"Not Found");
    else
        NSLog(@"%lu", (unsigned long)u);
        
    [pool drain];
    return 0;
}
