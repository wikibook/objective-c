#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 데이터 생성 
    NSData *data1 = [NSData dataWithBytes:"ABCD"
                                   length:4];
    NSData *data2 = [NSData dataWithBytes:"ABCD"
                                   length:4];
    NSData *data3 = [NSData dataWithBytes:"1234"
                                   length:4];
    
    // 데이터와 데이터를 비교 
    BOOL b;
    b = [data1 isEqualToData:data2];
    NSLog(@"data1 == data2 : %d", b);
    
    b = [data1 isEqualToData:data3];
    NSLog(@"data1 == data3 : %d", b);
    
    [pool drain];
    return 0;
}
