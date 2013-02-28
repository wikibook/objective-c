#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 사각형을 포함한 ‘NSValue’ 클래스의 인스턴스를 생성
    NSRect rt = NSMakeRect(5, 10, 20, 40);
    NSValue *value = [NSValue valueWithRect:rt];
    
    // ‘NSValue’ 클래스의 인스턴스에서 사각형을 취득함
    NSRect rt2 = [value rectValue];
    
    NSLog(@"%f, %f, %f, %f",
          (double)rt2.origin.x,
          (double)rt2.origin.y,
          (double)rt2.size.width,
          (double)rt2.size.height);
    
    [pool drain];
    return 0;
}
