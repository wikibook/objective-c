#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 가비지 컬렉션을 기동
    NSGarbageCollector *gc = [NSGarbageCollector defaultCollector];
    [gc enable];
    
    // 약한 참조 관계로 오브젝트를 보관하는 포인터 배열을 생성
    NSPointerArray *newArray;
    newArray = [NSPointerArray pointerArrayWithWeakObjects];
    
    id obj = [[NSObject alloc] init];
    
    // 포인터 배열에 추가
    [newArray addPointer:NULL];
    [newArray addPointer:obj];
    
    // 엘리먼트 수를 취득
    NSLog(@"count=%lu", (unsigned long)[newArray count]);    
    
    // ‘NULL’을 삭제
    [newArray compact];
    
    // 엘리먼트 수를 취득
    // ‘NULL’이 삭제되면 엘리먼트 수는 1이 됨
    NSLog(@"count=%lu", (unsigned long)[newArray count]);
    
    // 소멸 처리를 함
    [gc collectIfNeeded];
    [gc collectExhaustively];
    
    [pool drain];
    
    return 0;
}
