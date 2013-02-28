#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 데이터를 생성 
    NSMutableData *data = [NSMutableData data];
    char bytes[] = { 0, 1, 2, 3 };
    NSData *data2 = [NSData dataWithBytes:bytes
                                   length:sizeof(bytes)];
    
    // 데이터 'data2'의 일부를 데이터 'data'에 추가 
    NSRange range = NSMakeRange(1, 2);
    const unsigned char *p = [data2 bytes];
    
    [data appendBytes:(p + range.location)
               length:range.length];
    
    NSLog(@"%@", data);
    
    [pool drain];
    return 0;
}
