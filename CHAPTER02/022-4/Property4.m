#import <Foundation/Foundation.h>

@interface MyClass : NSObject
{
}
// 프로퍼티를 읽기전용으로 정의
@property (readonly) int data;
@end

@implementation MyClass

// 접근자 메서드를 구현
- (int)data
{
    // 1970년부터 지금까지 몇 초 지났는지 반환
    return (int)[[NSDate date] timeIntervalSince1970];
}

@end

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    MyClass *c = [[[MyClass alloc] init] autorelease];

    NSLog(@"%d", [c data]);
    
    [pool drain];
    return 0;
}