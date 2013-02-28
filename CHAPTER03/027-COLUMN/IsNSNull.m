#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 'NSNull' 클래스의 인스턴스를 생성
    id obj = [NSNull null];
    
    // 'NSNull' 클래스의 인스턴스를 생성해 비교함
    if (obj == [NSNull null])
        NSLog(@"obj == [NSNull null] : YES");
    else
        NSLog(@"obj == [NSNull null] : NO");

    // 'isEqual:' 메서드를 사용해서 판정할 수도 있음
    if ([obj isEqual:[NSNull null]])
        NSLog(@"[obj isEqual:[NSNull null]] : YES");
    else
        NSLog(@"[obj isEqual:[NSNull null]] : NO");
    
    // 유효한 인스턴스이므로 'nil'이 아님
    if (obj == nil)
        NSLog(@"obj == nil : YES");
    else
        NSLog(@"obj == nil : NO");

    // 'nil'과 비교해서는 판정할 수 없음 
    if ([obj isEqual:nil])
        NSLog(@"[obj isEqual:nil] : YES");
    else
        NSLog(@"[obj isEqual:nil] : NO");
    
    [pool drain];
    return 0;
}
