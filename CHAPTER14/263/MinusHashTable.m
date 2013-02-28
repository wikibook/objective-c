#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 가비지 컬렉션을 기동
    NSGarbageCollector *gc = [NSGarbageCollector defaultCollector];
    [gc enable];
    
    // 약한 참조 관계로 오브젝트를 보관하는 해시 테이블을 생성
    NSHashTable *hashTable, *hashTable2;
    
    hashTable = [NSHashTable hashTableWithWeakObjects];
    hashTable2 = [NSHashTable hashTableWithWeakObjects];
    
    // 오브젝트를 추가
    NSString *str = [NSString stringWithString:@"Item1"];
    NSString *str2 = [NSString stringWithString:@"Item2"];
    NSString *str3 = [NSString stringWithString:@"Item3"];
    
    [hashTable addObject:str];
    [hashTable addObject:str2];
    [hashTable addObject:str3];
    
    [hashTable2 addObject:str2];
    [hashTable2 addObject:str3];
    
    // 해시 테이블 내의 오브젝트를 표시
    NSLog(@"hashTable  = %@", hashTable);
    
    // 다른 해시 테이블에 보관된 오브젝트를 삭제
    // 여기에서는 ‘hashTable’ 에서 ‘hashTable2’ 에 보관된 
    // 오브젝트를 삭제   
    [hashTable minusHashTable:hashTable2];
    
    // 해시 테이블 내의 오브젝트를 표시
    NSLog(@"hashTable  = %@", hashTable);
    
    // 소멸 처리를 함
    [gc collectIfNeeded];
    [gc collectExhaustively];
    
    [pool drain];
    
    return 0;
}
