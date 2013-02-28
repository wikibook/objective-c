#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 빈 사전을 생성 
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    // 오브젝트를 추가 
    [dict setObject:@"Value1"
             forKey:@"Key1"];
    
    NSLog(@"%@", dict);
    
    // 같은 키를 지정해 오브젝트를 추가하면 오브젝트가 치환됨 
    [dict setObject:[NSNumber numberWithInteger:10]
             forKey:@"Key1"];
    
    NSLog(@"%@", dict);    
    [pool drain];
    return 0;
}
