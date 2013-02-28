#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열 생성
    NSArray *theArray;
    theArray = [NSArray arrayWithObjects:
                @"Value1", @"Value2", @"Value3", nil];
    
    // 인덱스번호를 지정해서 오브젝트를 취득
    NSUInteger u;
    id theObject;
    for (u = 0; u < [theArray count]; u++)
    {
        theObject = [theArray objectAtIndex:u];
        NSLog(@"[%lu]=%@", (unsigned long)u, theObject);
    }
    
    [pool drain];
    return 0;
}
