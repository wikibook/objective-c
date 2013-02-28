#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 데이터를 생성 
    NSData *data = [NSData data];
    NSData *data2 = [NSData dataWithBytes:"ABCDEF"
                                   length:6];
    NSMutableData *data3 = [NSMutableData dataWithLength:10];
    NSMutableData *data4 = [NSMutableData dataWithCapacity:10];
    
    // 데이터의 길이를 취득 
    NSUInteger len;
    len = [data length];    // 빈 데이터이므로 '0'
    NSLog(@"data  : %lu", (unsigned long)len);
    
    len = [data2 length];   // 파라미터로 지정한 사이즈 
    NSLog(@"data2 : %lu", (unsigned long)len);
    
    len = [data3 length];   // 파라미터로 지정한 사이즈 
    NSLog(@"data3 : %lu", (unsigned long)len);
    
    len = [data4 length];   // 내부 버퍼 크기를 지정한 것뿐이므로
                            // 데이터로서는 ‘0’ 이 됨
    NSLog(@"data4 : %lu", (unsigned long)len);
    
    [pool drain];
    return 0;
}
