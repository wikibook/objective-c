#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 사전을 생성
    NSMutableDictionary *dict;
    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
            @"Value1", @"Key1",
            @"Value2", @"Key2",
            @"Value3", @"Key3",
            @"Value4", @"Key4",
            @"Value5", @"Key5",
            nil];
    
    NSLog(@"dict=%@", dict);
    
    // 오브젝트를 전부 삭제 
    [dict removeAllObjects];
    NSLog(@"dict=%@", dict);
    
    [pool drain];
    return 0;
}
