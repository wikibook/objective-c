#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 빈 데이터를 생성 
    NSData *data;
    data = [NSData data];
    
    NSLog(@"%@", data);
    
    // 바이트열의 복사본을 가진 데이터를 생성 
    unsigned short shortValue = 0xAB50;
    data = [NSData dataWithBytes:&shortValue
                          length:2];
    NSLog(@"%@", data);
    
    [pool drain];
    
    return 0;
}
