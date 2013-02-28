#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 가비지 컬렉션을 기동
    NSGarbageCollector *gc = [NSGarbageCollector defaultCollector];
    [gc enable];
    
    // 약한 참조 관계로 오브젝트를 보관하는 해시 테이블을 생성
    NSHashTable *hashTable;
    
    hashTable = [NSHashTable hashTableWithWeakObjects];
    
    // 오브젝트를 추가
    NSString *str = [NSString stringWithString:@"Item1"];
    NSString *str2 = [NSString stringWithString:@"Item2"];
    
    [hashTable addObject:str];
    [hashTable addObject:str2];
    
    // 오브젝트가 해시 테이블에 포함되어 있는지 확인
    BOOL b;
    b = [hashTable containsObject:@"Item1"];
    NSLog(@"contains:'Item1' = %d", b);
    
    b = [hashTable containsObject:@"item"];
    NSLog(@"contains:'item'  = %d", b);
    
    // 소멸 처리를 함
    [gc collectIfNeeded];
    [gc collectExhaustively];
    
    [pool drain];
    
    return 0;
}
