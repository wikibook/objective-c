#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열 생성
    NSArray *theArray;
    theArray = [NSArray arrayWithObjects:
                @"Value1", @"Value2", @"Value3", nil];

	// 마지막 오브젝트를 취득
	id theObject = [theArray lastObject];
	
	NSLog(@"last=%@", theObject);
    [pool drain];
    return 0;
}
