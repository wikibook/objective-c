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
    
    // 오브젝트를 한 개 삭제 
    [set removeObject:@"value1"];
    NSLog(@"set=%@", set);
    
    [pool drain];
    return 0;
}
