#import <Foundation/Foundation.h>

class MyClass {
public:
    MyClass() { NSLog(@"MyClass::MyClass()"); }
    virtual ~MyClass() { NSLog(@"MyClass::~MyClass"); }
};

class MyClass2 {
public:
    MyClass2() { NSLog(@"MyClass2::MyClass2()"); }
    ~MyClass2() { NSLog(@"MyClass2::~MyClass2()"); }
};

@interface MyObject : NSObject
{
/*    
    MyClass     _myClass;       // 가상 함수를 갖고 있으므로
                                // 인스턴스 변수를 둘 수 없음
                                // (에러 발생)
 */
    MyClass     *_myClassPtr;   // 문제 없음
    MyClass2    *_myClass2Ptr;  // 문제 없음
}
- (void)doSomething;
@end

@implementation MyObject

- (void)doSomething
{
    // ‘new’가 생성자를 호출
    _myClassPtr = new MyClass();
    // ‘delete’가 소멸자를 호출
    delete _myClassPtr;
    
    // ‘new’가 생성자를 호출
    _myClass2Ptr = new MyClass2();
    // ‘delete’가 소멸자를 호출
    delete _myClass2Ptr;
    
    // 메서드에서 스택에 C++ 클래스를 두는 것도 가능 
    // 여기서 생성자를 호출
    MyClass c1;
    // 메서드를 벗어날 때 변수 ‘c1’의 소멸자가 호출됨
}

@end

int main(int argc, char **argv)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    MyObject *myObject = [[MyObject alloc] init];
    
    [myObject doSomething];
    [myObject release];
    [pool drain];
    return 0;
}
