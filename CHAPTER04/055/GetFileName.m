#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 원본 파일 경로를 작성
    NSString *path = [NSString stringWithString:
                      @"/Developer/Applications/Xcode.app"];
    
    // 파일명을 취득
    // 이 메서드는 경로 문자열의 마지막 컴포넌트를 반환
    NSLog(@"lastPathComponent = %@", [path lastPathComponent]);
    
    // 파일명에서 확장자를 삭제한 부분을 반환 
    // 파일명을 취득하고 확장자를 삭제하여 처리
    NSLog(@"File Name = %@",
        [[path lastPathComponent] stringByDeletingPathExtension]);

    // 상위 디렉터리의 경로를 취득
    // 이 메서드는 경로 문자열에서 마지막 컴포넌트를 삭제한 문자열을 반환
    NSLog(@"Directory Path = %@",
        [path stringByDeletingLastPathComponent]);
          
    // 상위 디렉터리명을 취득
    // 상위 디렉터리의 경로를 취득하고 마지막 컴포넌트를 삭제하여 처리    
    NSLog(@"Directory Name = %@",
        [[path stringByDeletingLastPathComponent] lastPathComponent]);
    
    // 확장자를 반환 
    NSLog(@"pathExtension = %@", [path pathExtension]);
    
    // 경로를 구성할 컴포넌트를 취득 
    NSArray *components = [path pathComponents];
    NSString *str;
    NSLog(@"Components:");
    for (str in components)
    {
        NSLog(@" %@", str);
    }
    
    [pool drain];
    return 0;
}
