#import <Foundation/Foundation.h>

// 변화를 통지하는 클래스
@interface NotifierClass : NSObject
{
    NSInteger _integerValue;
}
- (void)setIntegerValue:(NSInteger)i;
@end

// 통지받는 클래스
@interface ObserverClass : NSObject
{
}
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context;
@end

// 변화를 통지하는 클래스 구현
@implementation NotifierClass
- (void)setIntegerValue:(NSInteger)i
{
    _integerValue = i;
}
@end

// 통지받는 클래스 구현
@implementation ObserverClass

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    NSLog(@"***Observed");
    NSLog(@"KeyPath = %@", keyPath);
    NSLog(@"change = %@", [change description]);
}

@end

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    NotifierClass *notifierObj =
        [[[NotifierClass alloc] init] autorelease];
    ObserverClass *observerObj =
        [[[ObserverClass alloc] init] autorelease];
    
    // 등록하기 전이므로 변경해도 통지되지 않음
    NSLog(@"***Change to 1");
    [notifierObj setIntegerValue:1];
    
    // 통지를 받도록 등록함
    // 파라미터 ‘change’에 변경 전 값과 변경 후 값이 들어가도록 지정
    NSLog(@"***Register");
    NSKeyValueObservingOptions options =
        (NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld);
    [notifierObj addObserver:observerObj
                  forKeyPath:@"integerValue"
                     options:options
                     context:nil];
    // 등록을 했으므로 ‘observeValueForKeyPath:ofObject:change:context:’ 메서드가 
    // 호출됨
    NSLog(@"***Change to 10");
    [notifierObj setIntegerValue:10];
    
    // 등록을 해제
    NSLog(@"***Unregister");
    [notifierObj removeObserver:observerObj
                     forKeyPath:@"integerValue"];
    
    // 등록을 해제했으므로 변경이 통지되지 않음 
    NSLog(@"***Change to 5");
    [notifierObj setIntegerValue:5];
    
    [pool drain];
    return 0;
}
