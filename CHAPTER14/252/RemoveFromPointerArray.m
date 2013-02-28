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
    
    // 강한 참조 관계의 오브젝트를 생성
    NSString *str = [NSString stringWithString:@"Item1"];
    
    // 포인터 배열에 추가
    [newArray addPointer:str];
    
    // 보관한 오브젝트를 표시
    NSLog(@"%@", [newArray allObjects]);
    
    // 오브젝트를 삭제
    [newArray removePointerAtIndex:0];
    
    NSLog(@"%@", [newArray allObjects]);
    
    // 소멸 처리를 함
    [gc collectIfNeeded];
    [gc collectExhaustively];
    
    [pool drain];
    
    return 0;
}
