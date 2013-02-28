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
    
    // 일부를 치환 
    char bytes2[] = { 10, 11 };
    
    [data replaceBytesInRange:NSMakeRange(1, 2)
                    withBytes:bytes2];
    
    NSLog(@"%@", data);
    [pool drain];
    return 0;
}
