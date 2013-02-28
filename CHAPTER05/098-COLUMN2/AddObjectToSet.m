#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 빈 세트를 생성 
    NSMutableSet *set = [NSMutableSet set];
    
    // 다른 세트의 오브젝트를 추가 
    NSSet *set2 = [NSSet setWithObjects:
                   @"value5", @"value6", @"value7", nil];
    
    [set unionSet:set2];    
    
    NSLog(@"%@", set);
	
    [pool drain];
    return 0;
}
