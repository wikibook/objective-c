#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 오브젝트가 중복될 가능성이 있는 배열
    NSArray *theArray;
    theArray = [NSArray arrayWithObjects:
                @"Value3", @"Value1", @"Value3", nil];
    NSLog(@"srcArray=%@", theArray);
    
    // 배열에서 세트를 생성
    NSSet *theSet;
    theSet = [NSSet setWithArray:theArray];
    
    // 세트에서 오브젝트 취득 
    theArray = [theSet allObjects];
    NSLog(@"newArray=%@", theArray);    
    
    [pool drain];
    return 0;
}
