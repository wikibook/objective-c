#import <Foundation/Foundation.h>

// 구조체를 정의 
typedef struct {
    float   data0;
    int     data1;
} MyStruct;

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 구조체를 초기화 
    MyStruct myData;
    myData.data0 = 5.5;
    myData.data1 = 10;
    
    // 구조체에서 'NSValue' 클래스의 인스턴스를 생성 
    NSValue *value;
    value = [NSValue valueWithBytes:&myData
                           objCType:@encode(MyStruct)];
    
    // 'NSValue' 클래스의 인스턴스에서 구조체를 읽어들임 
    MyStruct myData2;
    [value getValue:&myData2];
    
    NSLog(@"data0=%f, data1=%d",
          myData2.data0, myData2.data1);
    
    [pool drain];
    return 0;
}
