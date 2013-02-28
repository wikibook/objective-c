#import <Foundation/Foundation.h>

// 'MyClass' 클래스 정의 
@interface MyClass : NSObject {
    NSInteger   _integerValue;
}
- (id)initWithValue:(NSInteger)i;
- (NSInteger)integerValue;
- (BOOL)isEqualToMyClass:(MyClass *)anObject;
@end
