#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열을 생성
    NSArray *theArray = [NSArray arrayWithObjects:
                         @"Value1",
                         @"Value2",
                         @"Value3",
                         @"Value4",
                         @"Value5",
                         nil];
    // 세트를 생성
    NSSet *theSet = [NSSet setWithArray:theArray];
    
    // 배열의 열거자를 취득 
    NSEnumerator *enumerator = [theArray objectEnumerator];
    id value;

    // 배열에서 오브젝트를 순서대로 취득
    // 마지막 오브젝트까지 취득하면 ‘nextObject’ 메서드는 ‘nil’을 반환 
    // 따라서 이 반복문은 마지막 오브젝트를 취득할 때까지 반복
    NSLog(@"From the array");
    while (value = [enumerator nextObject])
    {
        NSLog(@" %@", value);
    }
    
    // 세트의 열거자를 취득
    enumerator = [theSet objectEnumerator];
    
    // 세트에서 오브젝트를 순서대로 취득 
    NSLog(@"From the set");
    while (value = [enumerator nextObject])
    {
        NSLog(@" %@", value);
    }
    
    [pool drain];
    return 0;
}
