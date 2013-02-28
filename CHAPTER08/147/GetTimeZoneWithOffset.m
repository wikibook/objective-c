#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 시차를 지정해서 타임존을 취득
    // 서울의 타임존은 +9시간이므로 다음과 같이 됨
    NSTimeZone *tz;
    tz = [NSTimeZone timeZoneForSecondsFromGMT:(60 * 60 * 9)];
    
    NSLog(@"%@", tz);
    
    [pool drain];
    return 0;
}
