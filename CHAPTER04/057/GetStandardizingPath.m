#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 정규화할 경로 문자열 생성
    // 여기서는 기본이 되는 경로 문자열과 상대경로 문자열로부터 
    // 절대경로를 작성
    NSString *basePath =
        [NSString stringWithString:@"/Applications/Utilities"];
    NSString *relativePath =
        [NSString stringWithString:@"../TextEdit.app"];
    
    // 두 개의 경로 문자열을 연결
    NSString *path =
        [basePath stringByAppendingPathComponent:relativePath];
    
    NSLog(@"%@", path);
    
    // 생성한 경로 문자열을 정규화 
    path = [path stringByStandardizingPath];
    
    NSLog(@"%@", path);
    
    [pool drain];
    return 0;
}
