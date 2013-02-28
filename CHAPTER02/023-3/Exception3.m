#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NS_DURING
        NSArray *theArray = [NSArray arrayWithObjects:
                             @"0", @"1", @"2", nil];
        
        // 인덱스 번호 4의 엘리먼트가 없으므로 ‘NSArray’ 클래스는 예외를 발생시킴
        [theArray objectAtIndex:4]; 

    NS_HANDLER
        // 예외를 처리하는 코드
        NSLog(@"Name    : %@", [localException name]);
    NS_ENDHANDLER
    
    [pool drain];
    return 0;
}
