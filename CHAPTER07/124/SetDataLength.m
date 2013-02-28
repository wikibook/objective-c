#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 가변 데이터 생성 
    NSMutableData *data = [NSMutableData dataWithLength:10];
    NSInteger i;
    
    // ‘00 01 02 .. 08 09’ 의 바이트열 생성
    for (i = 0; i < 10; i++)
    {
        *((unsigned char *)[data mutableBytes] + i) = i;
    }
    
    NSLog(@"%@", data);
    
    // 데이터를 짧게 함 
    [data setLength:5];
    NSLog(@"%@", data);
    
    // 데이터를 길게 함 
    [data setLength:15];
    NSLog(@"%@", data);
    
    [pool drain];
    return 0;
}
