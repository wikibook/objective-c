#import <Foundation/Foundation.h>

@interface MyClass : NSObject
{
}
// 마지막 파라미터로 블록을 지정
// 블록은 'int' 타입의 파라미터 1개를 갖고, 'int' 타입의 값을 반환 
- (void)calcRange:(NSRange)range usingBlock:(int (^)(int x))block;
@end

@implementation MyClass

- (void)calcRange:(NSRange)range usingBlock:(int (^)(int x))block
{
    for (int i = 0; i < range.length; i++)
    {
        // 블록의 호출은 블록 변수레 '()'를 붙이고 '()'내에 파라피터를 기술
        NSLog(@"%d : %d", i, block(i));
    }
}

@end

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    MyClass *c = [[[MyClass alloc] init] autorelease];
    
    // 메소드의 파라미터로 직접 블록을 기술 
    [c calcRange:NSMakeRange(0, 10) usingBlock:^(int x) {
        return x * x;   // 제곱을 계산해서 반환 
    }];
    
    [pool drain];
    return 0;
}
