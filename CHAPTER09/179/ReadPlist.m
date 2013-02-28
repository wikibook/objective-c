#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 프로퍼티 리스트 파일을 읽어옴
    // 아래 경로는 알맞게 변경해주세요
    // 여기에서는 ‘/Users/gaheeyoon/Test.plist’를 읽어옴
    NSData *data = [NSData dataWithContentsOfFile:@"/Users/gaheeyoon/Test.plist"];
    id plist;
    
    NSPropertyListFormat format;
    NSString *errStr;
    
    plist = [NSPropertyListSerialization propertyListFromData:data
             mutabilityOption:NSPropertyListImmutable
                       format:&format
             errorDescription:&errStr];
    [errStr release];
    
    NSLog(@"%@", plist);
    
    [pool drain];
    return 0;
}
