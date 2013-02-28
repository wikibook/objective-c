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
    
    // 블록을 사용해 정렬
    NSArray *newArray;
    newArray = [srcArray sortedArrayUsingComparator:
                ^(id obj1, id obj2) {
                    // 두 오브젝트를 ‘compare:’ 메서드로 비교
                    return [obj1 compare:obj2];
                }];
    
    NSLog(@"newArray=%@", newArray);
    [pool drain];
    return 0;
}