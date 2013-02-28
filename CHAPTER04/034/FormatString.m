#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *str;
    float f = 11.242495;
    int i = 10;
    
    // 자동 소멸할 문자열을 생성 
    str = [NSString stringWithFormat:@"f = %f, i = %d", f, i];
    NSLog(@"%@", str);
    
    // 'NSString'의 문자열은 '%@'을 사용하고, C의 문자열은 '%s'를 사용
    str = [[NSString alloc]
           initWithFormat:@"%@ %s", @"First", "Second"];
    NSLog(@"%@", str);
    [str release];

    [pool drain];
    return 0;
}
