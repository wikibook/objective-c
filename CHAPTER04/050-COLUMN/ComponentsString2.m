#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 분할할 문자열을 생성
    NSString *str = @"The 1st line.\nThe 2nd line.";
    
    // 캐릭터 세트를 취득 
    NSCharacterSet *charSet;
    charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    // 문자열 분할
    NSArray *tokens;
    tokens = [str componentsSeparatedByCharactersInSet:charSet];
    
    NSLog(@"%@", tokens);
    [pool drain];
    return 0;
}
