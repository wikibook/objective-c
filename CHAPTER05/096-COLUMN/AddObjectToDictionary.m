#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 빈 사전을 생성
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    // 다른 사전에 포함된 오브젝트를 일괄적으로 추가
    NSDictionary *dict2;
    dict2 = [NSDictionary dictionaryWithObjectsAndKeys:
             @"value1", @"Key1",
             @"value2", @"Key2",
             nil];
    [dict addEntriesFromDictionary:dict2];
    
    NSLog(@"%@", dict);    
    [pool drain];
    return 0;
}
