#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 배열을 생성
    NSArray *array = [NSArray arrayWithObjects:
                      @"FIRST",
                      @"SECOND",
                      nil];
    
    // 배열에서 프로퍼티 리스트의 데이터를 생성 
    // 여기에서는 바이너리 형식을 지정
    NSData *data;
    NSString *errDesc = nil;
    
    data = [NSPropertyListSerialization dataFromPropertyList:array
            format:NSPropertyListBinaryFormat_v1_0
            errorDescription:&errDesc];
    
    // 에러 정보가 반환되면 해제해야 함
    [errDesc release];
    
    // 파일로 기록
    // 아래 경로는 알맞게 변경해주세요
    [data writeToFile:@"/Users/gaheeyoon/Test.plist"
           atomically:YES];
    
    [pool drain];
    return 0;
}
