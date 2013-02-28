#import <Foundation/Foundation.h>

// 타이머에서 실행할 클래스 정의
@interface MyObject : NSObject
{
    NSInteger   _counter;
}

// 카운터의 값을 취득하기 위해 프로퍼티 정의
@property NSInteger counter;

@end
