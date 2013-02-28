#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 세트를 생성
    NSSet *theSet;
    theSet = [NSSet setWithObjects:
              @"Value1", @"Value2", @"Value3", nil];
    
    // 세트에 지정된 오브젝트를 취득 
    NSArray *objectsArray = [theSet allObjects];
    
    NSLog(@"%@", objectsArray);
    [pool drain];
    return 0;
}
