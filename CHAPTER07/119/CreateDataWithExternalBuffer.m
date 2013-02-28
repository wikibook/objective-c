#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // ‘malloc’ 함수로 할당한 메모리블록을 사용하는 데이터 생성
    // 데이터 생성으로 전달된 메모리 블록은 인스턴스가 소멸될 때 ‘free’ 함수로 소멸된다 
    // 여기에서는 ‘00 01 02 ... 08 09’라는 바이트열을 생성
    NSData *data;
    unsigned char *p = (unsigned char *)malloc(10);
    NSInteger i = 0;
    for (i = 0; i < 10; i++)
    {
        *(p + i) = i;
    }
    
    data = [NSData dataWithBytesNoCopy:p
                                length:10];
    NSLog(@"%@", data);

    [pool drain];
    
    return 0;
}
