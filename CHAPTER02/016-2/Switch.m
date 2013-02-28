#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    int i;
    for (i = 0; i < 5; i++)
    {
        // 3으로 나눈 나머지에 따라 출력하는 문자열을 변경시킴
        switch (i % 3)
        {
            case 0: // 0 일 때 
                NSLog(@"Zero");
                break;
            case 1: // 1 일 때
                NSLog(@"One");
                break;
            case 2: // 2 일 때
                NSLog(@"Two");
                break;
        }
    }
    
    [pool drain];
    return 0;
}
