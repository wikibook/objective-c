#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 일시를 생성 
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    
    // 날짜가 ‘2009/10/26’인 오브젝트를 생성
    comps = [[[NSDateComponents alloc] init] autorelease];
    [comps setYear:2009];
    [comps setMonth:10];
    [comps setDay:26];
    
    NSDate *date = [calendar dateFromComponents:comps];    
    
    // 날짜가 ‘2009/10/28’인 오브젝트를 생성
    comps = [[[NSDateComponents alloc] init] autorelease];
    [comps setYear:2009];
    [comps setMonth:12];
    [comps setDay:28];
    
    NSDate *date2 = [calendar dateFromComponents:comps];    
    
    // 며칠 지났는지 조사
    NSUInteger flags = NSDayCalendarUnit;
    
    comps = [calendar components:flags
                        fromDate:date
                          toDate:date2
                         options:0];
    
    NSLog(@"date2 - date = %ld days", (long)[comps day]);
    
    // 몇 개월 혹은 며칠 형식으로 계산
    flags = NSMonthCalendarUnit | NSDayCalendarUnit;
    
    comps = [calendar components:flags
                        fromDate:date
                          toDate:date2
                         options:0];
    
    NSLog(@"date2 - date = %ld months and %ld days",
          (long)[comps month], (long)[comps day]);
    
    [pool drain];
    return 0;
}