#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // URL을 문자열로 지정
    // 여기에서는 웹 사이트의 URL을 생성
    NSURL *url = [NSURL URLWithString:@"http://www.wikibook.co.kr/"];
    
    NSLog(@"%@", url);
        
    [pool drain];
    return 0;
}
