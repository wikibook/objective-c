#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 시스템의 엔디언 취득 
    long byteOrder = NSHostByteOrder();
    
    if (byteOrder == NS_LittleEndian)
        NSLog(@"Little Endian");
    else
        NSLog(@"Big Endian");
    
    [pool drain];
    return 0;
}
