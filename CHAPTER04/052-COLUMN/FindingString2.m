#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 문자열 생성
    NSString *wholeStr = [NSString stringWithString:
      @"the Objective-C is a one of the programming language."];
    
    // 문자열의 끝지점부터 역방향으로 검색 
    NSRange range;
    NSStringCompareOptions options = 
        NSBackwardsSearch | NSCaseInsensitiveSearch;
    range = [wholeStr rangeOfString:@"THE"
                            options:options];
    NSLog(@"range={%u, %u}", range.location, range.length);
        
    [pool drain];
    return 0;
}
