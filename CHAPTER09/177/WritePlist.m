#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 사전을 생성 
    NSDictionary *dict;
    dict = [NSDictionary dictionaryWithObjectsAndKeys:
            @"Object", @"Key",
            [NSNumber numberWithInteger:10], @"Key2",
            nil];
    
    // 사전을 프로퍼티 리스트 파일로 기록
    // 아래 경로는 알맞게 변경해주세요
    // 여기에서는 ‘/Users/gaheeyoon/Test.plist’를 생성
    BOOL ret = [dict writeToFile:@"/Users/gaheeyoon/Test.plist"
                      atomically:YES];
    
    [pool drain];
    return 0;
}
