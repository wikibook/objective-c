#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 사이즈를 포함한 ‘NSValue’ 클래스의 인스턴스를 생성
    NSSize theSize = NSMakeSize(5, 10);
    NSValue *value = [NSValue valueWithSize:theSize];
    
    // ‘NSValue’ 클래스의 인스턴스에서 사이즈를 취득
    NSSize theSize2 = [value sizeValue];
    
    NSLog(@"%f, %f",
          (double)theSize2.width,
          (double)theSize2.height);
    
    [pool drain];
    return 0;
}