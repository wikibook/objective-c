#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 배열 생성
    NSArray *theArray = [NSArray arrayWithObjects:
                         @"Value1",
                         @"Value2",
                         @"Value3",
                         @"Value4",
                         @"Value5",
                         nil];
    
    // 고속열거를 사용
    // Objective-C 2.0부터 사용 가능
    // 각 오브젝트는 변수 ‘value’에 저장
    // 역순으로 취득하므로 ‘reverseObjectEnumerator’ 메서드의 반환 값에 대해 고속열거를 사용 
    // 오브젝트를 처음부터 마지막까지 전부 취득할 때까지 반복
    id value;
    for (value in [theArray reverseObjectEnumerator])
    {
        NSLog(@"%@", value);
    }
    
    [pool drain];
    return 0;
}