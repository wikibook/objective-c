#import <Foundation/Foundation.h>

//  Objective-C 클래스 선언 이외에는 네임스페이스를 정의할 수 있음
namespace MyNamespace2 {
    // C++ 클래스이므로 네임스페이스 안에서 선언할 수 있음
    class MyClass {
    public:
        MyClass() {}
        virtual ~MyClass() {}
        void Do() { NSLog(@"MyClass::Do()"); }
    };
}

int main (int argc, const char* argv[])
{
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    
    // 함수에서 네임스페이스 선언 내의 C++클래스를 사용할 수도 있음
    MyNamespace2::MyClass *p = new MyNamespace2::MyClass();
    p->Do();
    delete p;
    
    [pool drain];
    return 0;
}
