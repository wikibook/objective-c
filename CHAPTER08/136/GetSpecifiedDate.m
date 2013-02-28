#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 현재의 달력을 취득 
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    if (![[calendar calendarIdentifier]
        isEqualToString:NSGregorianCalendar])
    {
        // 그레고리력 이외의 달력이 사용됨
        // 그레고리력을 지정해서 달력 오브젝트를 생성
        calendar = [[[NSCalendar alloc]
                    initWithCalendarIdentifier:NSGregorianCalendar]
                    autorelease];
    }
    
    // 취득할 일시 정보를 포함한 ‘NSDateComponents’ 클래스의 인스턴스를 생성 
    // 여기에서는 2009년 10월 23일 21시 40분 25초를 지정
    NSDateComponents *comps = [[[NSDateComponents alloc] init]
                               autorelease];
    
    [comps setYear:2009];
    [comps setMonth:10];
    [comps setDay:23];
    [comps setHour:21];
    [comps setMinute:40];
    [comps setSecond:25];
    
    // 일시 오브젝트를 취득 
    NSDate *date = [calendar dateFromComponents:comps];
    
    NSLog(@"%@", date);
    
    [pool drain];
    return 0;
}
