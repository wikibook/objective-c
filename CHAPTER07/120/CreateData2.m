#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 복제할 대상 데이터를 생성 
    unsigned char bytes[] = { 0, 1, 2, 3, 4 };
    NSData *srcData = [NSData dataWithBytes:bytes
                                     length:sizeof(bytes)];
    
    NSLog(@"srcData=%@", srcData);
    
    // 데이터 복제 
    NSData *newData = [NSData dataWithData:srcData];
    
    NSLog(@"newData=%@", newData);    
    
    [pool drain];
    return 0;
}
