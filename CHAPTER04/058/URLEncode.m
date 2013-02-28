#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 인코딩할 문자열을 생성
    NSString *str = [NSString stringWithString:@"The Objective-C."];
    
    // URL인코딩
    // 텍스트 인코딩으로 ‘UTF-8’ 사용    
    str = [str stringByAddingPercentEscapesUsingEncoding:
           NSUTF8StringEncoding];

    NSLog(@"%@", str);
    
    // URL 디코딩하기
    // 위에서 텍스트 인코딩에 ‘UTF-8’을 사용했으므로
    // 디코딩도 ‘UTF-8’ 사용
    str = [str stringByReplacingPercentEscapesUsingEncoding:
           NSUTF8StringEncoding];
    
    NSLog(@"%@", str);
    
    
    [pool drain];
    return 0;
}
