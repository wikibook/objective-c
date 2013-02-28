#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 수치로 변환할 문자열 생성
    NSString *doubleStr = [NSString stringWithString:@"-40.305"];
    NSString *integerStr = [NSString stringWithString:@"  7"];
    NSString *boolStr = [NSString stringWithString:@"Yes"];
    
    // 실수로 변환
    double d = [doubleStr doubleValue];
    
    // 정수로 변환 
    NSInteger i = [integerStr integerValue];
    
    // 'BOOL' 타입으로 변환 
    BOOL b = [boolStr boolValue];
    
    NSLog(@"doubleValue = %f", d);
    NSLog(@"integerValue= %d", i);
    NSLog(@"boolValue=    %d", b);
    
    [pool drain];
    return 0;
}
