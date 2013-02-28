#import <Foundation/Foundation.h>

// 바이트열을 콘솔에 출력
void printBytes(const void *bytes, NSUInteger len, NSString *comment)
{
    NSLog(@"%@ : %lu bytes", comment, (unsigned long)len);

    if (bytes)
    {
        // 바이트마다 16진수로 출력
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
    NSMutableData *data = [NSMutableData dataWithLength:10];
    
    // 데이터의 바이트열 포인터를 취득
    // ‘NSMutableData’ 클래스에서는 읽기 쓰기 가능한 버퍼의 포인터를 취득할 수 있음
    void *p = [data mutableBytes];
    *((unsigned char *)p) = 0xFF;   // 처음 1바이트를 변경
    
    printBytes(p, [data length], @"data3");
    
    [pool drain];
    return 0;
}
