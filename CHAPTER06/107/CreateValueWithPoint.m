#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 좌표는 ‘NSPoint’ 타입
    NSPoint pt = NSMakePoint(5, 10);
    
    // 좌표를 포함한 ‘NSValue’ 클래스의 인스턴스를 생성
    NSValue *value = [NSValue valueWithPoint:pt];
    
    NSLog(@"%@", value);

    [pool drain];
    return 0;
}
