#import <Foundation/Foundation.h>
#import "MyObject.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 읽어옴
    // 아래 경로는 알맞게 변경해주세요
    id obj;
    obj = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/gaheeyoon/Test2.dat"];
    
    NSLog(@"%@", obj);
    
    [pool drain];
    return 0;
}
