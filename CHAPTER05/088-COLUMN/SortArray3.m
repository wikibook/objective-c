#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 배열을 생성
    NSMutableArray *array;
    array = [NSMutableArray arrayWithObjects:
                @"Value1", @"Value4", @"Value3",
                @"Value2", @"Value6", @"Value5", nil];
    
    NSLog(@"array=%@", array);
    
    // ‘NSMutableArray’클래스는 배열에서 직접 정렬할 수 있음 
    // 여기에서는 내림차순으로 정렬
    [array sortUsingComparator:
     ^(id obj1, id obj2) {
         // 두 개의 오브젝트를 ‘compare’메서드를 사용해 비교 
         // 내림차순으로 정렬하려고 하므로 결과를 반전시킴
         NSInteger result = [obj1 compare:obj2];
         
         if (result == NSOrderedAscending)
             result = NSOrderedDescending;
         else if (result == NSOrderedDescending)
             result = NSOrderedAscending;
         return result;
     }];
    
    NSLog(@"array=%@", array);
    [pool drain];
    return 0;
}