#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열을 생성
    NSArray *theArray;
    theArray = [NSArray arrayWithObjects:
                @"Value1", @"Value", @"Value3", nil];
    
    // 세트를 생성
    NSSet *theSet;
    theSet = [NSSet setWithArray:theArray];
    
    // 배열에 오브젝트가 포함돼 있는지 조사 
    NSString *strs[] = {
        [NSString stringWithString:@"Value1"],
        [NSString stringWithString:@"String"]
    };
    
    NSUInteger u;
    for (u = 0; u < 2; u++)
    {
        BOOL b;
        
        b = [theArray containsObject:strs[u]];
        NSLog(@"theArray contains '%@' : %d", strs[u], b);
        
        b = [theSet containsObject:strs[u]];
        NSLog(@"theSet contains '%@'   : %d", strs[u], b);
    }
    
    [pool drain];
    return 0;
}
