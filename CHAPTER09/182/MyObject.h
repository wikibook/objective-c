#import <Foundation/Foundation.h>

// 아카이브할 클래스의 정의 
@interface MyObject : NSObject {
    NSInteger   _intValue;
    NSString    *_str;
    MyObject    *_parent;
}

- (id)initWithParent:(id)parent;

@end
