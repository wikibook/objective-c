#import <Foundation/Foundation.h>

// 바이트열을 콘솔에 출력한다
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
        printf("\n");   // 줄바꿈
    }
}

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 데이터를 생성
    NSData *data = [NSData dataWithBytes:"ABCDEF"
                                  length:6];
    
    // 복사할 곳의 메모리블록을 할당
    // 여기에서는 ‘malloc’ 함수를 사용하고 있으나
    // ‘NSMutableData’ 클래스의 ‘mutableBytes’로 취득한 포인터나 
    // 스택상의 배열을 사용할 수도 있음
    unsigned char *p = malloc(10);
    memset(p, 0, 10);
    
    // 범위를 지정해서 복사
    [data getBytes:p range:NSMakeRange(3, 3)];
    printBytes(p, 10, @"Range={3,3}");
    
    free(p);
    [pool drain];
    return 0;
}