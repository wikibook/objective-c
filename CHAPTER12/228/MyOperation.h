#import <Foundation/Foundation.h>

// 커스텀 오퍼레이션 클래스를 정의
@interface MyOperation : NSOperation
{
    NSString *_name;
}
- (id)initWithName:(NSString *)name;
@end
