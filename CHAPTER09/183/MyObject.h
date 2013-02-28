#import <Foundation/Foundation.h>

// 아카이브에서 읽어오는 클래스의 정의
@interface MyObject : NSObject {
    NSInteger   _intValue;
    NSString    *_str;
    MyObject    *_parent;
}

@end
