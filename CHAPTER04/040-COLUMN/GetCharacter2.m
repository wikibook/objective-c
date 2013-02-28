#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 문자열 생성
    NSString *str = [NSString stringWithString:@"The string"];
    
    // 문자열을 복사할 버퍼 확보
    // 버퍼의 크기는 sizeof(unichar) * 문자 수가 됨
    unichar *buf = (unichar *)malloc(sizeof(unichar) * [str length]);
    
    if (buf != NULL)
    {
        // 문자열에서 변수 'buf'로 문자열 복사
        // 복사할 범위로 문자열 전체를 지정 
        [str getCharacters:buf
                     range:NSMakeRange(0, [str length])];
        
        // 버퍼에서 순서대로 문자열을 취득 
        unichar *p;
        unichar *pEnd = buf + [str length]; // 버퍼의 종료 주소값
        for (p = buf; p != pEnd; p++)
        {
            NSLog(@"%C", *p);
        }
    }
    
    [pool drain];
    return 0;
}