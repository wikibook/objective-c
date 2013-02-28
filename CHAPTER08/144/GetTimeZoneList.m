#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 타임존명의 목록을 취득 
    NSArray *names = [NSTimeZone knownTimeZoneNames];
    NSLog(@"%@", names);
    
    // 생략형 사전을 취득 
    NSDictionary *dict = [NSTimeZone abbreviationDictionary];
    NSLog(@"%@", dict);
    
    [pool drain];
    return 0;
}
