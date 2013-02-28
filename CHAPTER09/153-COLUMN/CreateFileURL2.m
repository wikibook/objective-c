#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 디렉터리 경로로 URL을 생성
    // 여기에서는 3개의 URL 오브젝트를 생성하고 있지만 모두 같은 디렉터리를 가리킴
    NSURL *url = [NSURL fileURLWithPath:@"/Data"];
    NSURL *url2 = [NSURL fileURLWithPath:@"/Data/"];
    NSURL *url3 = [NSURL fileURLWithPath:@"/Data"
                             isDirectory:YES];
    NSLog(@"%@", url);
    NSLog(@"%@", url2);
    NSLog(@"%@", url3);
    
    [pool drain];
    return 0;
}
