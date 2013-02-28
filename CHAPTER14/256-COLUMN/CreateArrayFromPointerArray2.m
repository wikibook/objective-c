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
    NSString *str2 = [NSString stringWithString:@"Item2"];
    
    // 포인터 배열에 추가
    [newArray addPointer:str];
    [newArray addPointer:NULL];
    [newArray addPointer:str2];
    
    // 배열을 생성
    NSArray *theArray = [newArray allObjects];
    
    NSLog(@"%@", theArray);
    
    // 소멸처리를 함
    [gc collectIfNeeded];
    [gc collectExhaustively];
    
    [pool drain];
    
    return 0;
}
