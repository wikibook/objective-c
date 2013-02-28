#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 기준이 될 URL을 생성
    NSURL *baseURL = [NSURL fileURLWithPath:
                      @"/Data/Images/Sample.jpg"];
    
    NSLog(@"baseURL  = %@", baseURL);
    
    // 같은 디렉터리의 URL을 생성
    // 여기에서는 ‘Sample2.jpg’를 지정
    NSURL *fileURL = [NSURL URLWithString:@"Sample2.jpg"
                            relativeToURL:baseURL];
    
    NSLog(@"fileURL  = %@", fileURL);
    
    // 상위 디렉터리의 URL을 생성
    // 여기에서는 ‘../Sample.txt’를 지정
    NSURL *fileURL2 = [NSURL URLWithString:@"../Sample.txt"
                             relativeToURL:baseURL];
    
    NSLog(@"fileURL2 = %@", fileURL2);
    
    
    [pool drain];
    return 0;
}
