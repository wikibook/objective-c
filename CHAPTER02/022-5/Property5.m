#import <Foundation/Foundation.h>

@interface MyClass : NSObject
{
    // 프로퍼티에 사용할 인스턴스 변수를 정의
    int         _data;
}
// 프로퍼티를 정의
@property int data;
@end

@implementation MyClass
// 프로퍼티 ‘data’의 인스턴스 변수로 ‘_data’를 사용한다고 정의
@synthesize data = _data;
@end

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    MyClass *c = [[[MyClass alloc] init] autorelease];
    
    // 프로퍼티에 값을 설정
    c.data = 50;
    
    // 프로퍼티에서 값을 취득
    int i = c.data;
    
    NSLog(@"%d", i);
    
    [pool drain];
    return 0;
}