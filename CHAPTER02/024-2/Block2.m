#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 0〜9까지의 값이 들어간 배열을 생성
    NSArray* theArray = [NSArray arrayWithObjects:
                         [NSNumber numberWithInt:0],
                         [NSNumber numberWithInt:1],
                         [NSNumber numberWithInt:2],
                         [NSNumber numberWithInt:3],
                         [NSNumber numberWithInt:4],
                         [NSNumber numberWithInt:5],
                         [NSNumber numberWithInt:6],
                         [NSNumber numberWithInt:7],
                         [NSNumber numberWithInt:8],
                         [NSNumber numberWithInt:9],
                         nil];
    
    [theArray enumerateObjectsUsingBlock:
        ^(id obj, NSUInteger idx, BOOL *stop) {
            // 파라미터 'obj' 가 각 엘리먼트임 
            // 이 경우에는 'theArray'에는 10개의 엘리먼트가 있기 때문에 
            // 이 부분은 10회 호출됨
            int x = [obj intValue];
            NSLog(@"%d x %d = %d", x, x, x * x);
    }];
    
    [pool drain];
    return 0;
}
