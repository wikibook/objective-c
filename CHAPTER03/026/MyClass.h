#import <Foundation/Foundation.h>

// ‘NSCopying’ 프로토콜과 ‘NSMutableCopying’ 프로토콜을 구현함을 선언
// 이 클래스는 인스턴스 생성 후에는 변경할 수 없으므로 이니셜라이져로 값을 받음
@interface MyClass : NSObject <NSCopying, NSMutableCopying> {
    NSInteger   _integerValue;
}
- (id)initWithInteger:(NSInteger)i;
- (NSInteger)integerValue;
@end
