#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 문자열 생성 
    NSString *wholeStr = [NSString stringWithString:
      @"the Objective-C is a one of the programming language."];
    
    // 문자열의 처음부터 검색
    NSRange range;
    range = [wholeStr rangeOfString:@"the"];
    NSLog(@"[wholeStr rangeOfString:]");
    NSLog(@"range={%u, %u}", range.location, range.length);
    
    // 문자열의 처음부터 끝까지 순서대로 모두 검색
    // 여기에서는 옵션을 지정해 대문자, 소문자를 구별하지 않고 검색   
    NSLog(@"[wholeStr rangeOfString:options:range:]");
    NSRange textSearchRange = NSMakeRange(0, [wholeStr length]);
    do
    {
        // 문자열을 대문자, 소문자 구별 없이 검색
        // 검색 범위를 변수 ‘textSearchRange’로 지정 
        // 초기값은 문자열 ‘wholeStr’의 처음부터 끝까지
        range = [wholeStr rangeOfString:@"the"
                                options:NSCaseInsensitiveSearch
                                  range:textSearchRange];

        // 변수 ‘textSearchRange’에서 주어진 범위의 문자열이 발견되지 않을 때는 
        // 반환값인 ‘location’ 값이 ‘NSNotFound’가 됨
        if (range.location != NSNotFound)
        {
            NSLog(@" range={%u, %u}", range.location, range.length);
            
            // 다음 검색할 범위는 발견된 문자열보다 다음이 되게 함
            textSearchRange.location = range.location + range.length;
            textSearchRange.length =
                [wholeStr length] - textSearchRange.location;
        }
    } while (range.location != NSNotFound); // 발견되는 동안에는 계속 반복
    
    [pool drain];
    return 0;
}
