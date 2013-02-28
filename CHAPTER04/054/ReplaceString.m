#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 원본 문자열 생성
    NSMutableString *str;
    str = [NSMutableString stringWithString:
           @"the Objective-C is a one of the programming language."];
    
    // 범위를 지정해 치환
    // 치환하기 전과 치환한 후의 문자열의 길이는 일치하지 않아도 됨 
    // ‘Objective-C’를 ‘objC’로 치환
    
    // 먼저 ‘Objective-C’를 검색
    NSRange range;
    range = [str rangeOfString:@"Objective-C"];
    
    // 문자열을 치환
    [str replaceCharactersInRange:range
                       withString:@"Objc"];
    
    NSLog(@"%@", str);
    [pool drain];
    return 0;
}
