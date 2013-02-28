#import <Foundation/Foundation.h>

// 정수타입을 정의
typedef unsigned long long  SerialNumber;

// 구조체의 타입을 정의
typedef struct {
    SerialNumber    sn;
    int             data0;
    int             data1;
} MyStruct, *MyStructPtr;

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    MyStructPtr p = (MyStructPtr)malloc(sizeof(MyStruct));
    
    p->sn = 10;
    p->data0 = 20;
    p->data1 = 30;
    
    NSLog(@"sn=%llu, data0=%d, data1=%d", 
          p->sn, p->data0, p->data1);

    free(p);
    [pool drain];
    return 0;
}
