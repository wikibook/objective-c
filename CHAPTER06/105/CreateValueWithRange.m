#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 범위는 ‘NSRange’타입
    NSRange range = NSMakeRange(10, 20);
    
    // 범위를 포함한 ‘NSValue’ 클래스의 인스턴스를 생성
    NSValue* value = [NSValue valueWithRange:range];
    
    NSLog(@"%@", value);
    
    [pool drain];
    return 0;
}
