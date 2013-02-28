#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 좌표를 포함한 ‘NSValue’ 클래스의 인스턴스를 생성
    NSPoint pt = NSMakePoint(5, 10);
    NSValue *value = [NSValue valueWithPoint:pt];
    
    // ‘NSValue’ 클래스의 인스턴스에서 좌표를 취득
    NSPoint pt2 = [value pointValue];
    
    NSLog(@"%f, %f",
          (double)pt2.x,
          (double)pt2.y);
    
    [pool drain];
    return 0;
}