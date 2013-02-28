#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 현재 일시의 오브젝트를 취득
    NSDate *currentDate = [NSDate date];
    
    NSLog(@"Base          : %@", currentDate);
    
    // 90일전 오브젝트를 취득
    NSDateComponents *comps = [[[NSDateComponents alloc] init]
                               autorelease];
    
    [comps setDay:-90];
    
    // 그레고리력 달력을 취득
    NSCalendar *calendar;
    calendar = [[[NSCalendar alloc]
                initWithCalendarIdentifier:NSGregorianCalendar]
                autorelease];
    
    // 오브젝트를 취득 
    NSDate *date;
    date = [calendar dateByAddingComponents:comps
                                     toDate:currentDate
                                    options:0];
    
    NSLog(@"Before 90days : %@", date);
    
    [pool drain];
    return 0;
}
