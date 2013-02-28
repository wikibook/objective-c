#import <Foundation/Foundation.h>

// 클래스 정의 
@interface MyObject : NSObject
{
}
+ (void)callbackWithInterval:(NSTimeInterval)t
                   selectors:(NSArray *)selectors
                      target:(id)target
                     context:(id)context;
@end

@implementation MyObject

// 시간간격을 두고 메서드를 호출 
+ (void)callbackWithInterval:(NSTimeInterval)t
                   selectors:(NSArray *)selectors
                      target:(id)target
                     context:(id)context
{
    // 배열에서 순서대로 취득 
    NSEnumerator *enumerator = [selectors objectEnumerator];
    NSString *str;
    
    while (str = [enumerator nextObject])
    {
        // 문자열을 셀렉터로 변환하고 그 셀렉터를 호출
        [target performSelector:NSSelectorFromString(str)
                     withObject:context];
        // 파라미터로 지정된 시간만큼 정지 
        [NSThread sleepUntilDate:
         [NSDate dateWithTimeIntervalSinceNow:t]];
    }
}

// 콜백 될 메서드 
- (void)log:(id)anObject
{
    NSLog(@"FIRST");
}

// 콜백 될 메서드2 
- (void)log2:(id)anObject
{
    NSLog(@"SECOND");
}

@end

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 호출할 2개의 메서드를 넣은 배열을 생성 
    NSArray *theArray;
    theArray = [NSArray arrayWithObjects:
                NSStringFromSelector(@selector(log:)),
                NSStringFromSelector(@selector(log2:)),
                nil];
    
    // 인스턴스 생성 
    MyObject *obj = [[MyObject alloc] init];
    
    // 메서드 호출 
    [MyObject callbackWithInterval:0.5
                         selectors:theArray
                            target:obj
                           context:nil];
    
    [pool drain];
    return 0;
}
