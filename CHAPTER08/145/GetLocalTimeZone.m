#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 로컬 타임존 취득 
    NSTimeZone *tz = [NSTimeZone localTimeZone];
    
    NSLog(@"%@", tz);
    
    [pool drain];
    return 0;
}
