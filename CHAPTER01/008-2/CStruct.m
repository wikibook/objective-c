#import <Foundation/Foundation.h>

@interface MyObject : NSObject
{
    // Objective-C의 클래스를 선언할 때 구조체를 선언할 수 있음
    struct MyStruct {
        int     data0;
        int     data1;
    } MyStruct;
    
    // 구조체의 변수도 Objective-C 클래스의 선언에서 사용할 수 있음
    struct MyStruct     _data;
}
@end

@implementation MyObject

- (id)init
{
    self = [super init];
    if (self)
    {
        _data.data0 = 3;
        _data.data1 = 2;
    }
    return self;
}

- (void)printData
{
    NSLog(@"%d, %d", _data.data0, _data.data1);
}

- (void)printDataFromExternal:(struct MyStruct)externalData
{
    NSLog(@"%d, %d", externalData.data0, externalData.data1);
}

@end

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    MyObject* myObject = [[[MyObject alloc] init] autorelease];
    [myObject printData];
    
    // Objective-C 클래스 선언에서 선언한 구조체는 전역으로 취급
    struct MyStruct data = { 10, 20 };
    [myObject printDataFromExternal:data];
    
    [pool drain];
    return 0;
}
