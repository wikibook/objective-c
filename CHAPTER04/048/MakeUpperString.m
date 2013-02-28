#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 변환하기 이전의 문자열을 생성
    NSString *srcStr =
        [NSString stringWithString:@"The objective-c language."];
    
    // 대문자로 변환 
    NSString *str = [srcStr uppercaseString];
    NSLog(@"%@", str);
    
    // 소문자로 변환 
    str = [srcStr lowercaseString];
    NSLog(@"%@", str);

    [pool drain];
    return 0;
}
