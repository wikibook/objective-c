#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 인스턴스를 생성
    NSString *str = [NSString string];
    
    // ‘length’ 메서드가 있는지 확인
    BOOL b = [str respondsToSelector:@selector(length)];
    
    NSLog(@"length : %d", b);
    
    // ‘count’ 메서드가 있는지 확인
    b = [str respondsToSelector:@selector(count)];
    
    NSLog(@"count  : %d", b);
        
    [pool drain];
    return 0;
}
