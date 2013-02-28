#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 현재 일시를 취득 
    NSDate *date = [NSDate date];
    
    // 달력을 취득 
    NSCalendar *calendar;
    calendar = [[[NSCalendar alloc]
                 initWithCalendarIdentifier:NSGregorianCalendar]
                autorelease];
    
    // 현재 값을 취득 
    NSDateComponents *comps;
    comps = [calendar components:NSHourCalendarUnit
                        fromDate:date];
    
    // 현재 타임존을 취득 
    NSTimeZone *tm = [calendar timeZone];
    
    NSLog(@"%@ : %ld", [tm name], [comps hour]);
    
    // 세계협정시(UTC)의 타임존을 취득
    tm = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    
    // 타임존을 달력에 설정 
    [calendar setTimeZone:tm];
    
    // 값을 취득 
    comps = [calendar components:NSHourCalendarUnit
                        fromDate:date];
    
    NSLog(@"%@ : %ld", [tm name], [comps hour]);
    
    [pool drain];
    return 0;
}
