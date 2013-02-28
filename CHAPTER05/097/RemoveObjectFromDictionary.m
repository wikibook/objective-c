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
    
    // 키를 지정해 오브젝트 삭제
    [dict removeObjectForKey:@"Key1"];
    NSLog(@"dict=%@", dict);
    
    // 사용하지 않는 키를 지정하면 아무 동작도 하지 않음 
    [dict removeObjectForKey:@"key"];
    NSLog(@"dict=%@", dict);
    
    [pool drain];
    return 0;
}
