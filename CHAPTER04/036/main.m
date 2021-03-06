#import <Foundation/Foundation.h>

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 문자열 파일에서 로컬라이즈 문자열을 읽어옴 
    NSString *str1 = NSLocalizedString(@"Red", @"");
    NSString *str2 = NSLocalizedString(@"Blue", @"");
    
    NSLog(@"Red  = %@", str1);
    NSLog(@"Blue = %@", str2);
    
    [pool drain];
    return 0;
}
