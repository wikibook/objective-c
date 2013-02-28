#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 해석할 문자열 생성
    NSString *srcStr = [NSString stringWithString:@"Result:10,0xFF"];
    
    // 문자열을 해석하기 위해 'NSScanner' 클래스를 사용
    NSScanner *scanner = [NSScanner scannerWithString:srcStr];
    
    // ':' 까지 읽어들임
    NSString *str;
    if ([scanner scanUpToString:@":" intoString:&str])
    {
        NSLog(@"%@", str);
    }
    
    // 정수를 읽어들임
    // 현재의 해석 시작 위치는 ':' 위치이므로 하나씩 뒤로 이동
    [scanner setScanLocation:[scanner scanLocation]+1];
    
    int i;
    if ([scanner scanInt:&i])
    {
        NSLog(@"%d", i);
    }
    
    // 16진수의 값을 읽어들임
    // 현재의 해석 시작 위치는 ',' 위치이므로 하나씩 뒤로 이동
    [scanner setScanLocation:[scanner scanLocation]+1];
    
    unsigned u;
    if ([scanner scanHexInt:&u])
    {
        NSLog(@"%u", u);
    }

    [pool drain];
    return 0;
}
