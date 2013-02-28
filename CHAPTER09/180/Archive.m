#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 아카이브함
    // 여기에서는 배열을 아키이브함
    NSArray *array = [NSArray arrayWithObjects:
                      @"FIRST",
                      @"SECOND",
                      nil];
    
    NSData *data;
    data = [NSKeyedArchiver archivedDataWithRootObject:array];
    
    // 파일에 기록
    // 아래 경로는 알맞게 변경해주세요
    [data writeToFile:@"/Users/gaheeyoon/Test.dat"
           atomically:YES];
    
    [pool drain];
    return 0;
}
