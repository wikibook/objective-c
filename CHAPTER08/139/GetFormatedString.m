#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 현재 일시를 취득 
    NSDate *date = [NSDate date];
    
    // 날짜 포멧터를 취득 
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init]
                                  autorelease];

    // 서식을 변경하면서 문자열을 출력
    NSDateFormatterStyle styles[] = {
        NSDateFormatterFullStyle,
        NSDateFormatterLongStyle,
        NSDateFormatterMediumStyle,
        NSDateFormatterShortStyle
    };
    
    NSInteger i;
    for (i = 0; i < sizeof(styles) / sizeof(styles[0]); i++)
    {
        // 날짜 서식을 설정 
        [formatter setDateStyle:styles[i]];
        
        // 시각 서식을 설정 
        [formatter setTimeStyle:styles[i]];
    
        // 문자열화 함 
        NSString *str = [formatter stringFromDate:date];
        
        NSLog(@"%@", str);
    }
    
    [pool drain];
    return 0;
}
