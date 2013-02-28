#import <Foundation/Foundation.h>

// 카테고리 정의
@interface NSArray (FindAddition)
- (NSUInteger)indexOfObjectWithTarget:(id)target
                           invocation:(NSInvocation *)invocation;
@end
