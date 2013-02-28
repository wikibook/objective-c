#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 가변 데이터를 생성 
    char bytes[] = { 0, 1, 2, 3 };
    NSMutableData *data;

    data = [NSMutableData dataWithBytes:bytes
                                 length:sizeof(bytes)];
    
    NSLog(@"%@", data);
    
    // 일부를 치환하지만 치환할 범위와 치환 후의 바이트열의 길이가 다름
    char bytes3[] = { 5, 6, 7, 8, 9 };
    
    [data replaceBytesInRange:NSMakeRange(1, 2)
                    withBytes:bytes3
                       length:sizeof(bytes3)];
    
    NSLog(@"%@", data);
    [pool drain];
    return 0;
}
