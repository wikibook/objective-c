#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 현재 일시를 취득 
    NSDate *date = [NSDate date];
    
    // 커스텀 포맷 문자열을 생성 
    NSString *formatStr;
    formatStr = @"yyyy/MM/dd HH:mm:ss";
    
    // 포맷터를 취득해서 설정 
    NSDateFormatter *formatter;

    formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:formatStr];
    
    // 일시를 문자열화 한다 
    NSString *str = [formatter stringFromDate:date];
    
    NSLog(@"%@", str);
    
    [pool drain];
    return 0;
}
