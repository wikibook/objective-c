#import <Foundation/Foundation.h>

// TestClass의 선언
@interface TestClass : NSObject
{
}
- (NSArray*)doSomething:(int)value;
- (NSArray*)createSomething:(int)value;
@end

// TestClass의 구현
@implementation TestClass

- (NSArray*)doSomething:(int)value
{
    NSArray* newArray = [self createSomething:value];
    return newArray;
}

- (NSArray*)createSomething:(int)value
{
    NSMutableArray* newArray = [NSMutableArray arrayWithCapacity:0];
    
    if (value > 0)
    {
        int i;
        for (i = 0; i < value; i++)
        {
            [newArray addObject:[NSNumber numberWithInt:i]];
        }
    }
    else
    {
        int i;
        for (i = value; i < 0; i++)
        {
            [newArray addObject:[NSNumber numberWithInt:i]];
        }
    }
    return newArray;
}

@end

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    TestClass* testObj = [[[TestClass alloc] init] autorelease];
    [testObj doSomething:10];
    [pool drain];
    return 0;
}
