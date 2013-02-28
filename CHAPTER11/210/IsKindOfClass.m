#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // 인스턴스 생성
    id obj = [NSString stringWithString:@"Test String"];
    
    // ‘NSString’ 클래스 또는 그 서브클래스인지 확인
    BOOL b = [obj isKindOfClass:[NSString class]];
    
    NSLog(@"isKindOfClass:NSString = %d", b);
    
    // ‘NSArray’ 클래스 또는 그 서브클래스인지 확인
    b = [obj isKindOfClass:[NSArray class]];
    
    NSLog(@"isKindOfClass:NSArray  = %d", b);
    
    [pool drain];
    return 0;
}
