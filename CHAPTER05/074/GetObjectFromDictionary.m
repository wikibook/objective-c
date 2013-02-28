#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 사전 생성
    NSDictionary *theDict;
    theDict = [NSDictionary dictionaryWithObjectsAndKeys:
               @"Value1", @"Key1",
               @"Value2", @"Key2",
               @"Value3", @"Key3",
               nil];
    
    // 오브젝트는 키를 지정해서 취득
    id theObject = [theDict objectForKey:@"Key2"];
    NSLog(@"[Key2]=%@", theObject);
    
    // 지정한 키에 대응하는 오브젝트가 없다면 'nil'을 반환
    theObject = [theDict objectForKey:@"Key4"];
    NSLog(@"[Key4]=%@", theObject);
    
    // 키는 대문자, 소문자를 구별 
    theObject = [theDict objectForKey:@"key2"];
    NSLog(@"[key2]=%@", theObject);

    [pool drain];
    return 0;
}
