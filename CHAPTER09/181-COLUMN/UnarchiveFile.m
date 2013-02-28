#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 파일에서 인스턴스를 생성
    // 아래 경로는 알맞게 변경해주세요
    id obj;
    obj = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/gaheeyoon/Test.dat"];
    
    NSLog(@"%@", obj);
    
    [pool drain];
    return 0;
}
