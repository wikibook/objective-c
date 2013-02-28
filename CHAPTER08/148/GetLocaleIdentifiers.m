#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 로케일 식별자 목록 취득
    NSArray *identifiers = [NSLocale availableLocaleIdentifiers];
    NSLog(@"%@", identifiers);
    
    [pool drain];
    return 0;
}
