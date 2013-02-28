#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    NSData *data2 = [NSData dataWithBytes:"A" length:1];
    const unsigned int maxCount = 100000000;

    // ‘appendData:’ 메서드를 반복
    NSDate *date = [NSDate date];
    NSMutableData *data = [NSMutableData data]; 
    for (unsigned int i = 0; i < maxCount; i++)
    {
        [data appendData:data2];
    }
    // 소요된 시간을 조사
    NSTimeInterval t = [[NSDate date] timeIntervalSinceDate:date];
    NSLog(@"%f sec", t);
    
    // 버퍼를 일괄적으로 할당하고 내용을 채움
    date = [NSDate date];
    data = [NSMutableData dataWithLength:maxCount];
    unsigned char *p = [data mutableBytes];
    for (unsigned int i = 0; i < maxCount; i++)
    {
        *(p++) = 'A';
    }
    // 소요된 시간을 조사
    t = [[NSDate date] timeIntervalSinceDate:date];
    NSLog(@"%f sec", t);
    
    [pool drain];
    return 0;
}
