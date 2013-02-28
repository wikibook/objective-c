#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 사각형은 ‘NSRect’ 타입
    NSRect rt = NSMakeRect(5, 10, 20, 40);
    
    // 사각형을 포함한 ‘NSValue’ 클래스의 인스턴스를 생성
    NSValue *value = [NSValue valueWithRect:rt];
    
    NSLog(@"%@", value);
    
    [pool drain];
    return 0;
}