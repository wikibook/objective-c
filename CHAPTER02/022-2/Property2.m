#import <Foundation/Foundation.h>

@interface MyClass : NSObject
{
    // 프로퍼티에 사용할 인스턴스 변수 정의
    int         _data;
}
// 프로퍼티 정의
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
    
    // 메서드 호출은 ‘@property’에서 지정한 프로퍼티명으로 실행
    [c setData:20];
    NSLog(@"%d", [c data]);
    
    [pool drain];
    return 0;
}