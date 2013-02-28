#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 현재 일시의 오브젝트를 취득
    NSDate *currentDate = [NSDate date];
    
    NSLog(@"Base          : %@", currentDate);
    
    // 25초 후의 오브젝트를 취득
    NSDate *date;
    
    date = [[[NSDate alloc] initWithTimeInterval:25.0
                                       sinceDate:currentDate]
            autorelease];
    NSLog(@"After 25sec   : %@", date);

    [pool drain];
    return 0;
}
