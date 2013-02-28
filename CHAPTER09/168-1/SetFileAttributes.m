#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 파일 정보 설정
    // 여기에서는 파일의 ‘읽기 전용’ 속성을 설정
    // 또한 여기에서는 설정 대상 파일을 신규로 생성하고 그 파일에 대해 처리
    // 아래 파일경로는 알맞게 변경해주세요 (파일의 위치 및 파일명)
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = @"/Users/gaheeyoon/Test.txt";
    
    // 파일 생성 
    [fileManager createFileAtPath:path
                         contents:nil
                       attributes:nil];
    
    // 설정을 변경
    // 변경할 정보만을 넣은 사전을 생성
    // 여기에서는 락(Lock) 속성을 설정
    NSNumber *value = [NSNumber numberWithBool:YES];
    NSDictionary *attr;
    attr = [NSDictionary dictionaryWithObject:value
                                       forKey:NSFileImmutable];
    
    BOOL ret = [fileManager setAttributes:attr
                             ofItemAtPath:path
                                    error:NULL];

    [pool release];
    return 0;
}
