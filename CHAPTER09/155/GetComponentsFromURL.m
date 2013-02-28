#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // URL 생성
    // 여기에서는 가공의 URL 생성하고 있음
    NSURL *url;
    url = [NSURL URLWithString:
           @"http://local.localdomain:80/index.html?a=b&c=10"];
    
    NSLog(@"scheme       : %@", [url scheme]);
    NSLog(@"host         : %@", [url host]);
    NSLog(@"port         : %@", [url port]);
    NSLog(@"path         : %@", [url path]);
    NSLog(@"flagment     : %@", [url fragment]);
    NSLog(@"query        : %@", [url query]);
    
    [pool drain];
    return 0;
}
