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
    
    // 추가할 데이터를 생성 
    char bytes2[] = { 4, 5, 6, 7 };
    NSData *data2 = [NSData dataWithBytes:bytes2
                                   length:sizeof(bytes)];
    
    // 데이터에 데이터를 추가 
    [data appendData:data2];
    
    NSLog(@"%@", data);
    
    [pool drain];
    return 0;
}
