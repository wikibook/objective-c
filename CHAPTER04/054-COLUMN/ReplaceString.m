#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 치환할 문자열 생성
    NSMutableString *str;
    str = [NSMutableString stringWithString:
           @"the Objective-C is a one of the programming language."];
    
    // 문자열에서 지정한 범위의 특정 문자열을 전부 치환
    // 여기에서는 ‘the’를 대문자, 소문자 구분 없이 전부 ‘THE’로 바꾸고 있음
    NSRange textSearchRange = NSMakeRange(0, [str length]);
    [str replaceOccurrencesOfString:@"the"
                         withString:@"THE"
                            options:NSCaseInsensitiveSearch
                              range:textSearchRange];
	NSLog(@"%@", str);
    [pool drain];
    return 0;
}
