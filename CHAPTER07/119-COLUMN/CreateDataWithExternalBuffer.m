#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // ‘malloc’ 함수 이외의 함수로 할당한 메모리블록을 사용해 데이터 생성 
    // 여기에서는 스택 상의 변수 포인터를 사용하고 있음
    // 스택 상의 변수는 ‘free’ 함수로 해제되지 않으므로
    // ‘free’ 함수가 사용되지 않게 파라미터 ‘freeWhenDone’에 ‘NO’를 전달
    NSUInteger u = 0xABCD1020;
    NSData *data;
    
    data = [NSData dataWithBytesNoCopy:&u
                                length:sizeof(NSUInteger)
                          freeWhenDone:NO];
    NSLog(@"%@", data);

    [pool drain];
    
    return 0;
}
