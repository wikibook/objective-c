#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    float f = 12.34;
    
    // 부동소수점수를 가진 'NSNumber' 클래스 인스턴스 생성 
    NSNumber *num;
    num = [NSNumber numberWithFloat:f];
    
    NSLog(@"%@", num);
    
    // 생성할 때 사용한 타입과는 다른 타입의 값도 취득할 수 있음 
    double d = [num doubleValue];
    NSLog(@"%f", d);
    
    // 부동소수점수로 생성한 인스턴스에서 정수를 취득할 수 있음 
    NSInteger i = [num integerValue];
    NSLog(@"%ld", (long)i);
    
    [pool drain];
    return 0;
}
