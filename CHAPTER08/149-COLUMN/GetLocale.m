#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 현재 사용자의 로케일을 취득 
    NSLocale *lc;
    lc = [NSLocale currentLocale];
    NSLog(@"current : %@", [lc localeIdentifier]);
    
    // 시스템의 로케일을 취득 
    lc = [NSLocale systemLocale];
    NSLog(@"system  : %@", [lc localeIdentifier]);
    
    [pool drain];
    return 0;
}
