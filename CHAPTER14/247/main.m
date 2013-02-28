#import <Foundation/Foundation.h>
#import "MyObject.h"

int main (int argc, const char * argv[])
{
    // 가비지 컬렉션을 기동
    NSGarbageCollector *gc = [NSGarbageCollector defaultCollector];
    [gc enable];
    
    NSInteger i;
    for (i = 0; i < 100; i++)
    {
        // 인스턴스를 생성 
        id obj = [[MyObject alloc] init];
        obj = nil;
        
        // 필요하다면 소멸처리를 함 
        [gc collectIfNeeded];
    }
    
    // 소멸 처리를 함 
    [gc collectExhaustively];
    
    return 0;
}
