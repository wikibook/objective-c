#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 일시를 생성
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    
    // ‘2009/10/26’인 오브젝트를 생성
    comps = [[[NSDateComponents alloc] init] autorelease];
    [comps setYear:2009];
    [comps setMonth:10];
    [comps setDay:26];
    
    NSDate *date = [calendar dateFromComponents:comps];    
    
    // ‘2009/10/28’인 오브젝트를 생성
    comps = [[[NSDateComponents alloc] init] autorelease];
    [comps setYear:2009];
    [comps setMonth:12];
    [comps setDay:28];
    
    NSDate *date2 = [calendar dateFromComponents:comps];    
    
    // 두 일시가 몇 초 차이가 나는지 조사
    NSTimeInterval t = [date2 timeIntervalSinceDate:date];
    NSLog(@"date2 - date = %f sec", t);
    
    [pool drain];
    return 0;
}