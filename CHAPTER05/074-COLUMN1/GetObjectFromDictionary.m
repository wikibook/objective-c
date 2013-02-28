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
    
    // 포함된 모든 오브젝트 취득 
    NSArray *allObjects = [theDict allValues];
    NSLog(@"All=%@", allObjects);

    [pool drain];
    return 0;
}
