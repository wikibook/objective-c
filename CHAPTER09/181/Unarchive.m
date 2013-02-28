#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 파일에서 데이터를 읽어옴
    // 아래 경로는 알맞게 변경해주세요
    NSData *data = [NSData dataWithContentsOfFile:@"/Users/gaheeyoon/Test.dat"];
    
    // 읽어온 데이터에서 인스턴스를 생성
    id obj;
    obj = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    NSLog(@"%@", obj);
    
    [pool drain];
    return 0;
}
