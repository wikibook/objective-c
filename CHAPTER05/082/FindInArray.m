#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열을 생성
    NSArray *theArray;
    theArray = [NSArray arrayWithObjects:
                @"Value1", @"Value2", @"Value3", nil];
    
    // 오브젝트를 검색
    NSUInteger u = [theArray indexOfObject:@"Value2"];
    
    NSLog(@"%lu", (unsigned long)u);
    
    // 오브젝트를 발견하지 못하면 'NSNotFound'가 반환됨 
    u = [theArray indexOfObject:@"Value"];
    if (u == NSNotFound)
        NSLog(@"Not Found");
    else
        NSLog(@"%lu", (unsigned long)u);
    
    [pool drain];
    return 0;
}
