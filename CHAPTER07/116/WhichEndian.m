#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

#ifdef __BIG_ENDIAN__
    // ‘빅엔디언’을 사용한 바이너리를 빌드할 때의 코드
    NSLog(@"Big Endian");
#endif
    
#ifdef __LITTLE_ENDIAN__
    // ‘리틀엔디언’을 사용한 바이너리를 빌드할 때의 코드
    NSLog(@"Little Endian");
#endif 
    
    
    [pool drain];
    return 0;
}
