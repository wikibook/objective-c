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
    
    // 블록 구문을 사용
    // 각 오브젝트에 적용할 코드를 블록으로 함
    // 각 오브젝트는 파라미터 ‘obj’ 로 전달됨
    // 역순으로 취득하기 위해 ‘NSEnumerationReverse’를 사용
    [theArray enumerateObjectsWithOptions:NSEnumerationReverse
                               usingBlock:
     ^(id obj, NSUInteger idx, BOOL *stop) {
         NSLog(@"%@", obj);
     }];
    
    [pool drain];
    return 0;
}
