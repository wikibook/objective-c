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
    
    // 고속열거를 사용해 배열의 오브젝트를 취득 
    // Objective-C 2.0부터 사용 가능
    // 각 오브젝트는 변수 ‘value’에 저장
    // 마지막 오브젝트를 취득할 때까지 반복
    id value;
    NSLog(@"From the array");
    for (value in theArray)
    {
        NSLog(@" %@", value);
    }
    
    // 고속열거를 사용해 세트의 오브젝트를 취득
    NSLog(@"From the set");
    for (value in theSet)
    {
        NSLog(@" %@", value);
    }
    
    [pool drain];
    return 0;
}
