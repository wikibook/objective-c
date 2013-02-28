#import <Foundation/Foundation.h>

@interface MyClass : NSObject
{
    int         _data;
}
// 프로퍼티 정의
@property int data;
@end

@implementation MyClass
// 접근자 메서드를 자동생성
@synthesize data = _data;

// 설정자 메서드는 독자적으로 구현
- (void)setData:(int)newValue
{
    // 값을 검사. 0 이상 10 미만일 때만 설정
    if (newValue >= 0 && newValue < 10)
    {
        _data = newValue;
    }
}

@end

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    MyClass *c = [[[MyClass alloc] init] autorelease];
    
    // 검사한 값이 범위 안이므로 설정됨
    [c setData:5];
    NSLog(@"%d", [c data]);

    // 10 이상이므로 설정되지 않음
    [c setData:12];
    NSLog(@"%d", [c data]);

    [pool drain];
    return 0;
}