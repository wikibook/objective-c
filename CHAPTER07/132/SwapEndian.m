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
        printf("\n");   // 줄바꿈
    }
}

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    int intValue = 10;
    
    // 원래 상태 
    printBytes(&intValue, sizeof(intValue), @"Base");
    
    // 엔디언 교체  
    intValue = NSSwapInt(intValue);
    printBytes(&intValue, sizeof(intValue), @"NSSwapInt");
    
    intValue = 10;
    
    // 실행 중인 머신의 엔디언에서 ‘리틀엔디언’으로 변환
    // 실행 중인 머신이 ‘리틀엔디언’이면 변환하지 않음
    // 실행 중인 머신이 ‘빅엔디언’이면 변환
    intValue = NSSwapHostIntToLittle(intValue);
    printBytes(&intValue, sizeof(intValue), @"NSSwapHostIntToLittle");
    
    intValue = 10;
    
    // 실행 중인 머신의 엔디언에서 ‘빅엔디언’으로 변환
    // 실행 중인 머신이 ‘리틀엔디언’이면 변환
    // 실행 중인 머신이 ‘빅엔디언’이면 변환하지 않음
    intValue = NSSwapHostIntToBig(intValue);
    printBytes(&intValue, sizeof(intValue), @"NSSwapHostIntToBig");
    
    
    [pool drain];
    return 0;
}
