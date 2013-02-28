#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 빈 세트를 생성 
    NSMutableSet *set = [NSMutableSet set];
    
    // 배열의 오브젝트를 일괄적으로 추가 
    NSArray *theArray;
    theArray = [NSArray arrayWithObjects:
                @"value2", @"value3", @"value4", nil];
    
    [set addObjectsFromArray:theArray];
    NSLog(@"%@", set);
	
    [pool drain];
    return 0;
}
