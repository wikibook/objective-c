#import <Foundation/Foundation.h>
#import "MyClass.h"

int main (int argc, const char *argv[]) 
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    MyClass *p1 = [[[MyClass alloc] init] autorelease];
    
    // KVC를 사용해 값을 취득 
    NSInteger intValue = [[p1 valueForKey:@"integerValue"] integerValue];
    NSString *strValue = [p1 valueForKey:@"strValue"];
    
    // 취득한 값을 로그에 출력 
    NSLog(@"intValue=%ld, strValue=\"%@\"", intValue, strValue);
    
    [pool drain];
    return 0;
}
