#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 사이즈는 ‘NSSize’ 타입
    NSSize theSize = NSMakeSize(5, 10);
    
    // 사이즈를 포함한 ‘NSValue’ 클래스의 인스턴스를 생성
    NSValue *value = [NSValue valueWithSize:theSize];
    
    NSLog(@"%@", value);
    
    [pool drain];
    return 0;
}