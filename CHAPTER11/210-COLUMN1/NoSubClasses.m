#import <Foundation/Foundation.h>

// 클래스 정의 
@interface MyObject : NSObject
{
}
@end

// 서브클래스 정의 
@interface MySubObject : MyObject
{
}
@end

@implementation MyObject
@end

@implementation MySubObject
@end

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
    // 서브클래스의 인스턴스 생성 
    MySubObject* subObj = [[[MySubObject alloc] init] autorelease];
    
    // 확인 
    NSLog(@"isKindOfClass:MyObject      = %d",
          [subObj isKindOfClass:[MyObject class]]);
    NSLog(@"isMemberOfClass:MyObject    = %d",
          [subObj isMemberOfClass:[MyObject class]]);
    NSLog(@"isMemberOfClass:MySubObject = %d",
          [subObj isMemberOfClass:[MySubObject class]]);
    
    [pool drain];
    return 0;
}
