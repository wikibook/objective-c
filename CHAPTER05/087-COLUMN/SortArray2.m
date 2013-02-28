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
    
    // ‘NSMutableArray’ 클래스는 직접 배열에서 정렬할 수 있음
    [array sortUsingSelector:@selector(compare:)];
    
    NSLog(@"array=%@", array);
    [pool drain];
    return 0;
}
