#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 가비지 컬렉션을 기동
    NSGarbageCollector *gc = [NSGarbageCollector defaultCollector];
    [gc enable];
    
    // 키가 강한 참조 관계이고 오브젝트가 약한 참조 관계인 맵 테이블을 생성
    NSMapTable *mapTable;
    
    mapTable = [NSMapTable mapTableWithStrongToWeakObjects];
    
    // 오브젝트를 추가
    NSString *str = [NSString stringWithString:@"Item1"];
    NSString *str2 = [NSString stringWithString:@"Item2"];
    NSString *str3 = [NSString stringWithString:@"Item3"];
    
    [mapTable setObject:str
                 forKey:@"Key1"];
    [mapTable setObject:str2
                 forKey:@"Key2"];
    [mapTable setObject:str3
                 forKey:@"Key3"];

    // 엘리먼트 수를 취득
    NSUInteger count = [mapTable count];
    
    NSLog(@"count = %lu", (unsigned long)count);
    
    // 소멸 처리를 함
    [gc collectIfNeeded];
    [gc collectExhaustively];
    
    [pool drain];
    
    return 0;
}
