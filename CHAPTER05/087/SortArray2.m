#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 배열을 생성
    NSArray *srcArray;
    srcArray = [NSArray arrayWithObjects:
                @"Value1", @"Value4", @"Value3",
                @"Value2", @"Value6", @"Value5", nil];
    
    NSLog(@"srcArray=%@", srcArray);
    
    // 포함된 오브젝트의 ‘compare:’ 메서드를 사용해 
    // 오브젝트를 비교하면서 정렬
    NSArray *newArray;
    newArray = [srcArray sortedArrayUsingSelector:
                @selector(compare:)];
    
    NSLog(@"newArray=%@", newArray);
    
    [pool drain];
    return 0;
}
