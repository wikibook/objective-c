#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 가비지 컬렉션을 시작
    NSGarbageCollector *gc = [NSGarbageCollector defaultCollector];
    [gc enable];

    // 약한 참조관계로 오브젝트를 보관하는 포인터 배열을 생성
    NSPointerArray *newArray;
    newArray = [NSPointerArray pointerArrayWithWeakObjects];
    
    // 강한 참조관계로 오브젝트를 보관하는 포인터 배열을 생성
    newArray = [NSPointerArray pointerArrayWithStrongObjects];

    // 소멸처리를 함
    [gc collectIfNeeded];
    [gc collectExhaustively];
    
    [pool drain];
    
    return 0;
}
