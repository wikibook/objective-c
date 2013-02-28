#import <Foundation/Foundation.h>

@interface Parent : NSObject
{
}
- (void)log;
@end

@interface Sub : Parent
{
}
@end

@implementation Parent

- (void)log
{
    NSLog(@"Parent");
}

@end

@implementation Sub

- (void)log
{
    NSLog(@"Sub");
}

@end

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    id p1 = [[[Parent alloc] init] autorelease];
    id p2 = [[[Sub alloc] init] autorelease];
    
    [p1 log];   // -[Parent log]가 호출됨
    [p2 log];   // -[Sub log]가 호출됨
    
    [pool drain];
    return 0;
}
