#import <Foundation/Foundation.h>

@interface MyClass : NSObject
{
    // 프로퍼티에서 사용할 인스턴스 변수 정의
    int         data;
    NSString    *dataName;
}
// 두 개의 프로퍼티 정의
@property int data;
@property (copy) NSString *dataName;
@end

@implementation MyClass
// 두 개의 프로퍼티에 대한 접근자 메서드 생성
@synthesize data;
@synthesize dataName;

- (id)init
{
    self = [super init];
    if (self)
    {
        // 인스턴스 변수 초기화
        data = 0;
        dataName = nil;
    }
    return self;
}

- (void)dealloc
{
    // 인스턴스 변수 소멸
    [dataName release];
    [super dealloc];
}
@end

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    MyClass *c = [[[MyClass alloc] init] autorelease];
    
    [c setDataName:@"The Data"]; // 프로퍼티 ‘dataName’ 설정
    [c setData:20];              // 프로퍼티 ‘data’ 설정
    
    // 두 개의 프로퍼티 값을 취득해 로그에 출력
    NSLog(@"%@ : %d", [c dataName], [c data]);
    
    [pool drain];
    return 0;
}
