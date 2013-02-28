#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 로케일 식별자를 지정해서 로케일 취득
    // 여기에서는 한국어 로케일을 취득
    NSLocale *lc;
    lc = [[[NSLocale alloc] initWithLocaleIdentifier:@"ko_KR"]
          autorelease];
    NSLog(@"%@", [lc localeIdentifier]);
    
    [pool drain];
    return 0;
}
