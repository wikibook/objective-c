#import "MyObject.h"

@implementation MyObject

// 서술 코드
// 10 이상 20 미만의 정수라면 ‘YES’를 반환
- (BOOL)predicateObject:(id)obj
                  index:(NSUInteger)idx
{
    if ([obj integerValue] >= 10 &&
        [obj integerValue] < 20)
    {
        return YES;
    }
    return NO;
}

@end
