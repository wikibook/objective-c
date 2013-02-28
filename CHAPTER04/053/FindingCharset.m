#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 문자열 생성
    NSString *wholeStr = [NSString stringWithString:
      @"The Objective-C 2.0 is the latest version."];
    
    // 문자열에서 수치를 검색
    NSCharacterSet *charSet =
        [NSCharacterSet decimalDigitCharacterSet];
    NSRange range;
    
    range = [wholeStr rangeOfCharacterFromSet:charSet];
    NSLog(@"range={%u, %u}", range.location, range.length);
    
    // 문자열에서 대문자 알파벳을 검색
    NSLog(@"-----");
    NSRange textSearchRange = NSMakeRange(0, [wholeStr length]);
    charSet = [NSCharacterSet uppercaseLetterCharacterSet];
    do
    {
        // 검색 범위를 변수 ‘textSearchRange’로 지정
        // 초기값은 문자열 ‘wholeStr’의 처음 지점부터 끝 지점까지
        range = [wholeStr rangeOfCharacterFromSet:charSet
                                          options:0
                                            range:textSearchRange];

        // 변수 ‘textSearchRange’에서 주어진 범위의 문자열이 발견되지 않을 때는 
        // 반환값의 ‘location’ 값이 ‘NSNotFound’가 됨
        if (range.location != NSNotFound)
        {
            NSLog(@"range={%u, %u}", range.location, range.length);
            
            // 다음 검색할 범위는 발견된 문자열보다 다음이 되게 함
            textSearchRange.location = range.location + range.length;
            textSearchRange.length =
            [wholeStr length] - textSearchRange.location;
        }
    } while (range.location != NSNotFound); // 발견할 때까지 반복
    
    [pool drain];
    return 0;
}


