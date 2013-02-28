#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 현재 일시를 취득 
    NSDate *date = [NSDate date];
    
    // 포맷터를 취득 
    NSDateFormatter *formatter;
    formatter = [[[NSDateFormatter alloc] init] autorelease];
    
    [formatter setDateStyle:NSDateFormatterFullStyle];
    [formatter setTimeStyle:NSDateFormatterFullStyle];
    
    // 현재 로케일로 문자열화 
    NSString *str = [formatter stringFromDate:date];
    NSLocale *lc = [formatter locale];
    
    NSLog(@"%@ : %@", [lc localeIdentifier], str);
    
    // ‘en_US’ 로케일로 문자열화
    lc = [[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease];
    [formatter setLocale:lc];
    str = [formatter stringFromDate:date];
    
    NSLog(@"%@ : %@", [lc localeIdentifier], str);
   
    [pool drain];
    return 0;
}
