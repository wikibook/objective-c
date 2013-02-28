#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 변환하기 이전의 문자열을 생성
    NSString *str =
        [NSString stringWithString:@"The objective-c language."];
    
    str = [str capitalizedString];
    NSLog(@"%@", str);
    
    [pool drain];
    return 0;
}
