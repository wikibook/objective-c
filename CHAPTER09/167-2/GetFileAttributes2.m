#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 파일의 정보를 취득
    // 여기에서는 ‘Xcode’의 정보를 취득
    // Xcode.app의 파일경로는 알맞게 변경해주세요 (파일의 위치 및 파일명)
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = @"/Applications/Xcode.app";
    NSDictionary *attr;
    
    attr = [fileManager fileAttributesAtPath:path
                                traverseLink:NO];
    
    NSLog(@"attr  = %@", attr);
    
    [pool release];
    return 0;
}
