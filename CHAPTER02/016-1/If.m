#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 대문자와 소문자를 교대로 바꾸면서 알파벳을 출력함
    int i;
    for (i = 0; i < 26; i++)
    {
        // 짝수일 때는 대문자로 출력함
        if ((i % 2) == 0)
            printf("%c", 'A' + i);
        else
            printf("%c", 'a' + i);
    }
    
    
    [pool drain];
    return 0;
}
