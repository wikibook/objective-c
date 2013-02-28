#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 사전을 생성
    NSDictionary *theDict;
    theDict = [NSDictionary dictionaryWithObjectsAndKeys:
               @"Value1", @"Key1",
               @"Value2", @"Key2",
               @"Value3", @"Key3",
               nil];
    
    // 키의 목록을 취득
    NSArray *keysArray = [theDict allKeys];
    NSUInteger u;
    
    for (u = 0; u < [keysArray count]; u++)
    {
        // 키를 취득
        id theKey = [keysArray objectAtIndex:u];
        // 키를 지정해서 오브젝트를 취득 
        id theObj = [theDict objectForKey:theKey];
        
        NSLog(@"[%@]=%@", theKey, theObj);
    }
        
    [pool drain];
    return 0;
}
