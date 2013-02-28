#import <Foundation/Foundation.h>

// 바이트열을 콘솔에 출력
void printBytes(const void *bytes, NSUInteger len, NSString *comment)
{
    NSLog(@"%@ : %lu bytes", comment, (unsigned long)len);

    if (bytes)
    {
        // 바이트별로 16진수로 출력
        // 한 자리 숫자일 때는 앞에 ‘0’을 붙이도록 ‘%02X’를 사용
        const unsigned char *p = (const unsigned char *)bytes;
        const unsigned char *end = p + len;
        
        for (; p != end; p++)
        {
            printf("%02X ", *p);
        }
        printf("\n");   // 줄 바꿈
    }
}

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 데이터를 생성
    NSData *data = [NSData data];
    NSData *data2 = [NSData dataWithBytes:"ABCDEF"
                                   length:6];
    
    // 데이터의 바이트열 포인터를 취득
    // ‘NSData’ 클래스에서는 읽기 전용 버퍼 포인터를 취득할 수 있음
    const void *cp = [data bytes];  // 빈 데이터이므로 ‘NULL’이 반환됨
    printBytes(cp, [data length], @"data");
    
    cp = [data2 bytes];
    printBytes(cp, [data2 length], @"data2");
        
    [pool drain];
    return 0;
}
