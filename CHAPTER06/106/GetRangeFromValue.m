#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 범위를 포함한 ‘NSValue’ 클래스의 인스턴스를 생성
    NSRange range = NSMakeRange(10, 20);
    NSValue* value = [NSValue valueWithRange:range];
    
    // ‘NSValue’ 클래스의 인스턴스에서 범위를 취득
    NSRange range2 = [value rangeValue];
    
    NSLog(@"%lu, %lu",
          (unsigned long)range2.location,
          (unsigned long)range2.length);
    
    [pool drain];
    return 0;
}