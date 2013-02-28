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
    
    // 블록 구문을 사용해 배열에서 오브젝트를 취득
    // 각 오브젝트에 적용할 코드를 블록으로 만듬
    // 각 오브젝트는 파라미터 ‘obj’로 전달됨
    NSLog(@"From the array");
    [theArray enumerateObjectsUsingBlock:
     ^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@" %@", obj);
    }];
    
    // 블록 구문을 사용해 세트에서 오브젝트를 취득
    // 세트는 배열과는 달리 인덱스번호로 오브젝트를 취득할 수 
    // 없으므로 블록 파라미터에도 인덱스 번호가 없음
    NSLog(@"From the set");
    [theSet enumerateObjectsUsingBlock:
     ^(id obj, BOOL *stop) {
         NSLog(@" %@", obj);
     }];
    
    [pool drain];
    return 0;
}
