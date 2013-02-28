#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
    // 가변 데이터를 생성
    NSMutableData *data = [NSMutableData dataWithLength:0];
    
    @try
    {
        // 32 비트 환경에서 할당할 수 없는 크기로 변경
        [data setLength:0xFFFFFFFF];
    }
    @catch (NSException *e)
    {
        // 취득한 예외를 로그에 출력
        NSLog(@"Exception Name : %@", [e name]);
        NSLog(@"Reason : %@", [e reason]);
    }
    
    [pool drain];
    return 0;
}
