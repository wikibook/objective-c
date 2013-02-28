#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 셀렉터의 문자열 표시를 생성
    // 여기에서는 ‘description’ 메서드의 문자열 표시를 생성 
    
    // 메서드에서 셀렉터 취득
    SEL sel = @selector(description);
    
    // 셀렉터에서 문자열 취득
    NSString *str = NSStringFromSelector(sel);
    
    NSLog(@"%@", str);
    
    [pool drain];
    return 0;
}
