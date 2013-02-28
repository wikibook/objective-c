#import <Foundation/Foundation.h>

class MyClass {
public:
    MyClass() {
        _str = nil;
    }
    
    virtual ~MyClass() {
        [_str release];
    }
    
    // Objective-C 클래스의 인스턴스를 C++ 메서드의 파라미터로 사용할 수 있음
    void DoSomething(NSString *newStr) {
        if (_str != newStr)
        {
            [_str release];
            _str = [newStr copy];
        }
        NSLog(@"%@", _str);
    }
    
private:
    // Objective-C 클래스의 인스턴스를 멤버 변수로 사용할 수 있음
    NSString *_str;
};

@interface MyObject : NSObject
{
    // C++ 클래스의 인스턴스 포인터를 Objective-C 클래스의
    // 인스턴스 변수로 사용할 수 있음
    MyClass *_data;
}
// Objective-C 메서드의 파라미터로 C++ 인스턴스 포인터를 사용할 수 있음
- (void)doSomething:(MyClass *)p;
@end

@implementation MyObject

- (void)doSomething:(MyClass *)p
{
    _data = p;
    if (_data)
    {
        _data->DoSomething(@"Call From Objective-C Method");
    }
}

@end

int main(int argc, char **argv)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    MyClass *p = new MyClass();
    MyObject *p2 = [[MyObject alloc] init];
    
    [p2 doSomething:p];
    [p2 release];
    delete p;
    [pool drain];
    return 0;
}