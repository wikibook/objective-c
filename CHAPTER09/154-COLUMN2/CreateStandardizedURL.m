#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 기준이 될 URL 생성
    // 이 시점에서 ‘~’를 변환해야 함
	NSString *str = @"~/Images/Sample.jpg";
    NSURL *baseURL = [NSURL fileURLWithPath:
					  [str stringByExpandingTildeInPath]];
    
    // 상대 URL을 생성
    NSURL *fileURL = [NSURL URLWithString:@"../Sample.txt"
                            relativeToURL:baseURL];

    // 정규화
    fileURL = [[fileURL absoluteURL] standardizedURL];
    
    NSLog(@"fileURL = %@", fileURL);
    [pool drain];
    return 0;
}
