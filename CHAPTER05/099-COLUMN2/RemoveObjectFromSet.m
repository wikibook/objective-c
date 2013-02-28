#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 세트를 생성 
    NSMutableSet *set;
    set = [NSMutableSet setWithObjects:
           @"value1", @"value2", @"value3",
           @"value4", @"value5", @"value6", nil];
    
    NSLog(@"set=%@", set);
    
    // 다른 세트에 포함된 오브젝트를 남기고 나머지 오브젝트를 삭제
    NSSet *set3;
    set3 = [NSSet setWithObjects:
            @"value3", @"value6", @"val", nil];
    [set intersectSet:set3];
    NSLog(@"set=%@", set);
    
    [pool drain];
    return 0;
}
