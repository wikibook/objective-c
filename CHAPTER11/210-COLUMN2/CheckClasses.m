#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 프로퍼티 리스트 파일을 읽어옴
    // ‘NSDictionary’ 클래스의 메서드로 읽어오므로
    // 변수 ‘dict’는 ‘NSDictionary’ 클래스가 됨
    // 아래 경로는 알맞게 변경해주세요
    NSDictionary *dict;
    dict = [NSDictionary dictionaryWithContentsOfFile:@"Users/gaheeyoon/Test.plist"];
    
    // 사전에서 취득한 오브젝트는 어떤 클래스인지 알 수 없음
    NSNumber *num = [dict objectForKey:@"number"];
    
    // ‘NSNumber’ 클래스인지 확인
    if ([num isKindOfClass:[NSNumber class]])
    {
        NSLog(@"OK (%d)", [num intValue]);
    }

    [pool drain];
    return 0;
}