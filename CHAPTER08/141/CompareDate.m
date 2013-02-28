#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    NSDate *dates[3] = { nil, nil, nil };
    
    // 일시를 생성 
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    
    // 날짜가 ‘2009/10/26’인 오브젝트를 생성
    comps = [[[NSDateComponents alloc] init] autorelease];
    [comps setYear:2009];
    [comps setMonth:10];
    [comps setDay:26];
    
    dates[0] = [calendar dateFromComponents:comps];    
    
    // 날짜가 ‘2008/10/26’인 오브젝트를 생성
    comps = [[[NSDateComponents alloc] init] autorelease];
    [comps setYear:2008];
    [comps setMonth:10];
    [comps setDay:26];
    
    dates[1] = [calendar dateFromComponents:comps];    
    
    // 날짜가 '2009/10/28'인 오브젝트를 생성
    comps = [[[NSDateComponents alloc] init] autorelease];
    [comps setYear:2009];
    [comps setMonth:10];
    [comps setDay:28];
    
    dates[2] = [calendar dateFromComponents:comps];    
    
    // 각 일시를 비교
    NSInteger i;
    for (i = 1; i < 3; i++)
    {
        NSLog(@"Compare :");
        NSLog(@" %@", dates[0]);
        NSLog(@" %@", dates[i]);
        // 두 일시가 같은지 조사
        NSLog(@"isEqualToDate=%d", [dates[0] isEqualToDate:dates[i]]);
        // 두 일시를 비교 
        NSLog(@"compare=%ld", [dates[0] compare:dates[i]]);
        
        NSLog(@"-------------------------");
    }
    
    [pool drain];
    return 0;
}
