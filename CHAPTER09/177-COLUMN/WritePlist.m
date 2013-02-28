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
    
    // 아래 경로는 알맞게 변경해주세요
    // 사전을 프로퍼티 리스트 파일로 저장
    NSURL *url = [NSURL fileURLWithPath:@"/Users/gaheeyoon/Test.plist"];
    BOOL ret = [dict writeToURL:url
                     atomically:YES];
    
    [pool drain];
    return 0;
}
