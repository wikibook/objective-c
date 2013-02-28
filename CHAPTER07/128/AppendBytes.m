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
    
    // 바이트열을 추가 
    char bytes2[] = { 4, 5, 6, 7 };
    [data appendBytes:bytes2
               length:sizeof(bytes2)];
    
    NSLog(@"%@", data);
    
    [pool drain];
    return 0;
}
