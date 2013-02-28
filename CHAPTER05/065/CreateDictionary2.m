#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 원본 사전 생성
    NSDictionary *srcDict;
    srcDict = [NSDictionary dictionaryWithObjectsAndKeys:
               @"Value1", @"Key1",
               @"Value2", @"Key2",
               @"Value3", @"Key3",
               nil];
    
    // 사전을 복제함
    NSDictionary *dict;
    dict = [NSDictionary dictionaryWithDictionary:srcDict];
    
    NSLog(@"%@", dict);
    
    [pool drain];
    return 0;
}
