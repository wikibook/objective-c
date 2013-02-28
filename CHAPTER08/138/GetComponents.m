#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 현재 일시를 취득 
    NSDate *date = [NSDate date];

    // 현재의 달력을 취득 
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 취득한 정보를 플래그로 지정 
    NSUInteger flags =
        NSEraCalendarUnit |             // 서력(A.D)인지 아닌지
        NSYearCalendarUnit |            // 년
        NSMonthCalendarUnit |           // 월
        NSDayCalendarUnit |             // 일
        NSHourCalendarUnit |            // 시
        NSMinuteCalendarUnit |          // 분
        NSSecondCalendarUnit |          // 초
        NSWeekCalendarUnit |            // 한 해의 몇 번째 주인가
        NSWeekdayCalendarUnit |         // 요일
        NSWeekdayOrdinalCalendarUnit;   // 한 달의 몇 번째 요일인가 
    
    // 컴포넌트를 취득 
    NSDateComponents *comps = [calendar components:flags
                                          fromDate:date];
    
    // 컴포넌트에서 각 정보를 취득 
    NSLog(@"Era     : %ld", (long)[comps era]);
    NSLog(@"Year    : %ld", (long)[comps year]);
    NSLog(@"Month   : %ld", (long)[comps month]);
    NSLog(@"Day     : %ld", (long)[comps day]);
    NSLog(@"Hour    : %ld", (long)[comps hour]);
    NSLog(@"Minute  : %ld", (long)[comps minute]);
    NSLog(@"Second  : %ld", (long)[comps second]);
    NSLog(@"Week    : %ld", (long)[comps week]);
    NSLog(@"Weekday : %ld", (long)[comps weekday]);
    NSLog(@"Weekday Ordinal : %ld", (long)[comps weekdayOrdinal]);
    
    [pool drain];
    return 0;
}
