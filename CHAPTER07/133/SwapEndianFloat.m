#import <Foundation/Foundation.h>

// 바이트열을 콘솔에 출력 
void printBytes(const void *bytes, NSUInteger len, NSString *comment)
{
    NSLog(@"%@ : %lu bytes", comment, (unsigned long)len);
    
    if (bytes)
    {
        // 바이트 별로 16진수로 출력
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
    
    float f = 10.15f;
    
    // 원래 상태
    NSSwappedFloat sf = NSConvertHostFloatToSwapped(f);
    printBytes(&sf.v, sizeof(sf.v), @"Base");
    NSLog(@"%f", f);
    
    // 엔디언 교체
    sf = NSSwapFloat(sf);
    printBytes(&sf.v, sizeof(sf.v), @"NSSwapFloat");
    f = NSConvertSwappedFloatToHost(sf);
    NSLog(@"%f", f);
    
    f = 10.15f;
        
    // 실행 중인 머신의 엔디언에서 ‘리틀엔디언’으로 변환
    // 실행 중인 머신이 ‘리틀엔디언’이면 변환하지 않음
    // 실행 중인 머신이 ‘빅엔디언’이면 변환
    sf = NSSwapHostFloatToLittle(f);
    printBytes(&sf.v, sizeof(sf.v), @"NSSwapHostFloatToLittle");
    f = NSConvertSwappedFloatToHost(sf);
    NSLog(@"%f", f);
    
    f = 10.15f;
    
    // 실행 중인 머신의 엔디언에서 ‘빅엔디언’으로 변환
    // 실행 중인 머신이 ‘리틀엔디언’이면 변환
    // 실행 중인 머신이 ‘빅엔디언’이면 변환하지 않음
    sf = NSSwapHostFloatToBig(f);
    printBytes(&sf.v, sizeof(sf.v), @"NSSwapHostFloatToBig");
    f = NSConvertSwappedFloatToHost(sf);
    NSLog(@"%f", f);
    
    [pool drain];
    return 0;
}