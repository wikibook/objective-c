#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 타임존을 이름으로 취득 
    NSTimeZone *tz;
    tz = [NSTimeZone timeZoneWithName:@"Asia/Seoul"];
    NSLog(@"%@", tz);
    
    // 타임존을 생략표기로 취득 
    tz = [NSTimeZone timeZoneWithAbbreviation:@"KST"];
    NSLog(@"%@", tz);
    
    [pool drain];
    return 0;
}
