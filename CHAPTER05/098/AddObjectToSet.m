#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 빈 세트 생성 
    NSMutableSet *set = [NSMutableSet set];
    
    // 오브젝트 추가 
    [set addObject:@"value1"];
    NSLog(@"%@", set);
    
    // 중복되는 오브젝트는 추가되지 않음 
    [set addObject:@"value1"];    
    NSLog(@"%@", set);
        
    [pool drain];
    return 0;
}
