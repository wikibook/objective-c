#import <Foundation/Foundation.h>

// 구조체 정의
typedef struct {
    float   data0;
    int     data1;
} MyStruct;

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 구조체 초기화 
    MyStruct myData;
    myData.data0 = 5.5;
    myData.data1 = 10;
    
    // 구조체에서 'NSValue' 클래스의 인스턴스를 생성 
    NSValue *value;
    value = [NSValue valueWithBytes:&myData
                           objCType:@encode(MyStruct)];
    
	NSLog(@"%@", value);
	
    [pool drain];
    return 0;
}
