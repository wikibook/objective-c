#import "FindAddition.h"

@implementation NSArray (FindAddition)

// 검색 메서드의 정의
// 오브젝트가 발견되면 인덱스 번호를 반환하고,
// 발견되지 않으면 ‘NSNotFound’를 반환
- (NSUInteger)indexOfObjectWithTarget:(id)target
                           invocation:(NSInvocation *)invocation
{
    // 모든 오브젝트를 처음부터 순서대로 조사 
    id obj;
    NSUInteger idx = 0;
    for (obj in self)
    {
        // 배열에 오브젝트가 많을 때는 반복 횟수 또한
        // 많아지므로 한 번 실행될 때에
        // 오브젝트가 자동소멸되게 함
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        
        // ‘NSInvocation’ 클래스를 통해 코드를 호출해 ‘YES’가 반환되면 검색 종료
        BOOL ret;
        
        // 파라미터에 오브젝트와 인덱스 번호를 세트로 지정 
        [invocation setArgument:&obj atIndex:2];    
        [invocation setArgument:&idx atIndex:3];
        // 로직을 호출 
        [invocation invokeWithTarget:target];
        // 반환값을 취득 
        [invocation getReturnValue:&ret];
        
        // 'YES'가 반환되면 검색 종료 
        if (ret)
        {
            // 자동소멸 대상의 오브젝트를 소멸 
            [pool drain];  
            // 인덱스 번호를 반환 
            return idx;
        }
        
        idx++;
        
        // 자동소멸 대상 오브젝트를 소멸 
        [pool drain];
    }
    // 발견되지 않을 경우 'NSNotFound'를 반환 
    return NSNotFound;
}

@end
