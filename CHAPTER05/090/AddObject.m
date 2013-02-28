#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 빈 배열을 생성 
    NSArray *theArray = [NSArray array];
    
    // 오브젝트를 한 개 포함한 배열을 생성 
    theArray = [theArray arrayByAddingObject:@"value1"];
    NSLog(@"%@", theArray);
    
    // 가변 배열을 생성 
    NSMutableArray *mutableArray = [NSMutableArray array];
    
    // 오브젝트를 한 개 추가 
    [mutableArray addObject:@"value1"];
    NSLog(@"%@", mutableArray);
        
    [pool drain];
    return 0;
}