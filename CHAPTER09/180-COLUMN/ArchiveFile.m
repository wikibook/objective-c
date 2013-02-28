#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 아카이브 함
    // 여기에서는 배열을 아카이브 함
    NSArray *array = [NSArray arrayWithObjects:
                      @"FIRST",
                      @"SECOND",
                      nil];
    
    // 파일에 아카이브 함
    // 아래 경로는 알맞게 변경해주세요
    BOOL ret;
    ret = [NSKeyedArchiver archiveRootObject:array
                                      toFile:@"/Users/gaheeyoon/Test.dat"];
    
    [pool drain];
    return 0;
}
