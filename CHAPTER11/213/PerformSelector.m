#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 인스턴스 생성 
    NSMutableArray *theArray = [NSMutableArray arrayWithCapacity:0];
    
    // 호출 메서드를 셀렉터로 지정하므로 셀렉터를 생성 
    SEL sel = @selector(addObject:);
    
    // 인스턴스와 셀렉터를 지정해 메서드를 호출
    // 여기에서는 ‘addObject:’ 메서드에 파라미터를 하나 지정해 호출
    [theArray performSelector:sel
                   withObject:@"item"];
    
    
    NSLog(@"%@", theArray);
    
    [pool drain];
    return 0;
}
