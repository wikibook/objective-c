#import <Foundation/Foundation.h>
#import "FindAddition.h"
#import "MyObject.h"

// 메인 함수
int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열 생성
    NSArray *theArray;
    theArray = [NSArray arrayWithObjects:
                [NSNumber numberWithInteger:5],
                [NSNumber numberWithInteger:9],
                [NSNumber numberWithInteger:12],
                [NSNumber numberWithInteger:16],
                [NSNumber numberWithInteger:20],
                nil];

    // 검색을 위한 준비 
    MyObject *myObject = [[[MyObject alloc] init] autorelease];
    SEL sel = @selector(predicateObject:index:);
    NSInvocation* invocation;
    
    invocation = [NSInvocation invocationWithMethodSignature:
                  [myObject methodSignatureForSelector:sel]];
    [invocation setSelector:sel];
    
    // 검색 실행 
    NSUInteger u;
    u = [theArray indexOfObjectWithTarget:myObject
                               invocation:invocation];
    
    NSLog(@"Found : %lu", (unsigned long)u);
    
    [pool drain];
    return 0;
}
