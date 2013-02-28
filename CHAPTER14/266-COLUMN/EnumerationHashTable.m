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
    NSString *str3 = [NSString stringWithString:@"Item3"];
    
    [hashTable addObject:str];
    [hashTable addObject:str2];
    [hashTable addObject:str3];
    
    // 오브젝트를 순서대로 취득하는 ‘NSEnumerator’ 클래스의 인스턴스를 취득
    NSEnumerator *enumerator = [hashTable objectEnumerator];
    id item;

    // 오브젝트를 하나 취득
    while (item = [enumerator nextObject])
    {
        NSLog(@"%@", item);
    }
    
    // 소멸 처리를 함 
    [gc collectIfNeeded];
    [gc collectExhaustively];
    [pool drain];
    
    return 0;
}
