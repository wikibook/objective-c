#import <Foundation/Foundation.h>

// 리틀엔디언은 1을 반환하고 빅엔디언은 0을 반환
int isLittleEndian()
{
    unsigned char buf[2] = { 0, 0 };
    
    // 리틀엔디언이면 첫 바이트는 1이 되고 
    // 빅엔디언이면 첫 바이트는 0이 됨
    *((unsigned short *)buf) = 1;
    return (buf[0] == 1) ? 1 : 0;
}

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 시스템의 엔디언을 취득 
    if (isLittleEndian())
        NSLog(@"Little Endian");
    else
        NSLog(@"Big Endian");
    
    [pool drain];
    return 0;
}
