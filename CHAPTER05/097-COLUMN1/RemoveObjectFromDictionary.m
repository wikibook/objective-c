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
    
    // 여러 개의 키를 지정할 때는 배열을 사용 
    NSArray *keysArray;
    keysArray = [NSArray arrayWithObjects:
                 @"Key3", @"Key4", nil];
    [dict removeObjectsForKeys:keysArray];
    
    NSLog(@"dict=%@", dict);
    
    [pool drain];
    return 0;
}
