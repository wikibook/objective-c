#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    @try
    {
        NSArray *theArray = [NSArray arrayWithObjects:
                             @"0", @"1", @"2", nil];

        // 인덱스 번호 4의 엘리먼트는 없으므로
        // ‘NSArray’ 클래스는 예외를 발생시킴
        NSString *str = [theArray objectAtIndex:4]; 

        // 이 코드는 실행되지 않음
        NSLog(@"The String : %@", str); 
    }
    @catch (NSException *e)
    {
        // 예외를 처리하기 위한 코드
        NSLog(@"Name    : %@", [e name]);
        NSLog(@"Reason  : %@", [e reason]);
        NSLog(@"UserInfo: %@", [[e userInfo] description]);
    }
    
    [pool drain];
    return 0;
}
