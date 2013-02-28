#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 가변 데이터를 생성 
    char bytes[] = { 0, 1, 2, 3, 4 };
    NSMutableData *data;
    
    data = [NSMutableData dataWithBytes:bytes
                                 length:sizeof(bytes)];
    
    NSLog(@"%@", data);
    
    // 일부분을 삭제 
    [data replaceBytesInRange:NSMakeRange(1, 3)
                    withBytes:NULL
                       length:0];
    
    NSLog(@"%@", data);
    
    [pool drain];
    return 0;
}
