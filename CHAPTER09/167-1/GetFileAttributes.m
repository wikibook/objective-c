#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 파일의 정보를 취득
    // 여기에서는 ‘Xcode’ 의 정보를 취득
    NSFileManager *fileManager = [NSFileManager defaultManager];

    // Xcode의 파일경로는 알맞게 변경해주세요
    // NSString *path = @"/Developer/Applications/Xcode.app";
    NSString *path = @"/Applications/Xcode.app";
    NSError *err = nil;
    NSDictionary *attr;
    
    attr = [fileManager attributesOfItemAtPath:path
                                         error:&err];
    
    NSLog(@"error = %@", err);
    NSLog(@"attr  = %@", attr);
    
    [pool drain];
    return 0;
}
