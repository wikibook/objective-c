#import <Foundation/Foundation.h>
#import "MyObject.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 인스턴스 생성 
    MyObject *obj = [[[MyObject alloc] initWithParent:nil]
                     autorelease];
    MyObject *obj2 = [[[MyObject alloc] initWithParent:obj]
                      autorelease];
    
    NSArray *array = [NSArray arrayWithObjects:obj, obj2, nil];
    
    // 아카이브 함
    // 아래 경로는 알맞게 변경해주세요
    [NSKeyedArchiver archiveRootObject:array
                                toFile:@"/Users/gaheeyoon/Test2.dat"];
    
    [pool drain];
    return 0;
}
