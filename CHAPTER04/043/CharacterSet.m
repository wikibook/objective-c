#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 영문자와 숫자로 구성된 캐릭터 세트
    NSCharacterSet *alnumCharSet =
        [NSCharacterSet alphanumericCharacterSet];

    // 공백 문자로 구성된 캐릭터 세트 
    NSCharacterSet *wsCharSet =
        [NSCharacterSet whitespaceCharacterSet];
    
    // 숫자만으로 구성된 캐릭터 세트
    // 여기에서는 문자열로부터 캐릭터 세트를 생성하고 있지만
    // ‘decimalDigitCharacterSet’ 메서드를 사용할 수도 있음
    NSCharacterSet *numCharSet =
        [NSCharacterSet characterSetWithCharactersInString:
        @"0123456789"];
    
    // 알파벳만으로 구성된 캐릭터 세트
    // 범위를 지정하는 방법으로 캐릭터 세트에 문자를 추가
    NSMutableCharacterSet *alCharSet =
        [[[NSMutableCharacterSet alloc] init] autorelease];
    // 'a'부터 'z'까지 추가
    [alCharSet addCharactersInRange:NSMakeRange('a', 26)];
    // 'A'부터 'Z'까지 추가 
    [alCharSet addCharactersInRange:NSMakeRange('A', 26)];

    
    // 판정할 문자
    unichar charArray[] = {
        'A', 'a', '3', ' '
    };
    
    // 배열에서 순서대로 문자를 취득해 판정 
    unsigned int ind;
    unsigned int numOfCharacters =
        sizeof(charArray) / sizeof(charArray[0]);
    for (ind = 0; ind < numOfCharacters; ind++)
    {
        // 캐릭터 세트별로 문자가 캐릭터 세트에 포함돼 있는지 판정
        BOOL isAlnum =
            [alnumCharSet characterIsMember:charArray[ind]];
        BOOL isWS =
            [wsCharSet characterIsMember:charArray[ind]];
        BOOL isNum =
            [numCharSet characterIsMember:charArray[ind]];
        BOOL isAlphabet =
            [alCharSet characterIsMember:charArray[ind]];
        
        // 결과를 로그에 출력
        NSLog(@"'%C'\n alnum=%d\n ws=%d\n num=%d\n alphabet=%d",
              charArray[ind], isAlnum, isWS, isNum, isAlphabet);
    }
    
    [pool drain];
    return 0;
}
