#import <Foundation/Foundation.h>

int main(int argc, char **argv)
{
    NSAutoreleasePool   *pool = [[NSAutoreleasePool alloc] init];
    NSString            *str;
    NSMutableString     *str2;
    
    // 빈 문자열 생성
    str = [NSString string];
    NSLog(@"str='%@'", str);
    
    // 문자열의 복사본 생성
    str = [NSString stringWithString:@"String"];
    NSLog(@"str='%@'", str);
    
    // 'NSMutableString' 클래스 전용 
    // 빈 문자열을 생성하고 미리 지정한 크기의 내부 버퍼를 확보해 둠 
    // 버퍼 크기는 파라미터로 지정
    str2 = [NSMutableString stringWithCapacity:0];
    NSLog(@"str2='%@'", str2);
    
    // 이니셜라이져를 사용해 빈 문자열을 생성 
    str = [[[NSString alloc] init] autorelease];
    NSLog(@"str='%@'", str);
    
    // 이니셜라이져를 사용해 문자열의 복사본을 생성 
    str = [[[NSString alloc] initWithString:@"String"] autorelease];
    NSLog(@"str='%@'", str);
    
    // 'NSMutableString' 클래스 전용
    // 빈 문자열을 생성하고 미리 지정한 크기의 내부 버퍼를 확보해둠
    // 버퍼 크기는 파라미터로 지정 
    str2 = [[[NSMutableString alloc] initWithCapacity:0]
            autorelease];
    
    NSLog(@"str2'%@'", str2);
    
    [pool drain];            
    return 0;
}
