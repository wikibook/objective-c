#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 현재 일시 취득
    NSDate *date = [NSDate date];
    
    NSLog(@"%@", date);
    
    [pool drain];
    return 0;
}
