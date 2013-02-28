#import <Foundation/Foundation.h>
#import "MyObject.h"

int main (int argc, const char * argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 가비지 컬렉션을 기동
    NSGarbageCollector *gc = [NSGarbageCollector defaultCollector];
    [gc enable];
    
    // 오브젝트를 두 개 생성
    id myObj = [[MyObject alloc] init];
    id myObj2 = [[MyObject alloc] init];
    
    // 사용하지 않음을 명시하기 위해 ‘nil’을 입력
    myObj = myObj2 = nil;
    
    // 수동으로 소멸처리를 기동
    [gc collectIfNeeded];
    [gc collectExhaustively];
    
    [pool drain];
    return 0;
}
