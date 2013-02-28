#import <Foundation/Foundation.h>

// 카테고리를 사용해 ‘NSString’ 클래스에 두 개의 메서드를 추가한다고 선언
@interface NSString (NameAddition)
- (NSString *)firstName;
- (NSString *)lastName;
@end

// 카테고리를 사용해 선언한 메서드를 구현
@implementation NSString (NameAddition)
- (NSString *)firstName
{
    // 스페이스로 문자열을 구분
    NSArray *tokens = [self componentsSeparatedByString:@" "];
    // ‘objectAtIndex:’ 메서드는 무효한 인덱스번호를 입력하면 예외를 발생시키므로 
    // 문자열 개수의 확인 필요
    if ([tokens count] > 0)
    {
        // 첫 번째 문자열을 반환
        return [tokens objectAtIndex:0];
    }
    return nil;
}

- (NSString *)lastName
{
    // 스페이스로 문자열을 구분
    NSArray *tokens = [self componentsSeparatedByString:@" "];
    // 구분한 문자열의 가장 마지막 문자열을 반환
    return [tokens lastObject];
}
@end

int main (int argc, const char *argv[]) 
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    NSString *str = [NSString stringWithString:@"Akira Hayashi"];
    NSLog(@"First Name : %@", [str firstName]);
    NSLog(@"Last Name  : %@", [str lastName]);
    
    [pool drain];
    return 0;
}
