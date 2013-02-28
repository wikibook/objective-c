#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 빈 데이터를 생성 
    NSMutableData *data;
    data = [NSMutableData data];
    
    NSLog(@"%@", data);
    
    // 길이를 지정해서 데이터 생성
    // 바이트열은 ‘0’으로 초기화됨
    data = [NSMutableData dataWithLength:10];
    NSLog(@"%@", data);
    
    // 내부 버퍼의 초기 사이즈를 지정해서 데이터를 생성
    data = [NSMutableData dataWithCapacity:10];
    NSLog(@"%@", data);
    
    // 바이트열의 복사본을 가진 데이터 생성
    unsigned short shortValue = 0xAB50;
    data = [NSMutableData dataWithBytes:&shortValue
                                 length:2];
    NSLog(@"%@", data);

    [pool drain];
    
    return 0;
}