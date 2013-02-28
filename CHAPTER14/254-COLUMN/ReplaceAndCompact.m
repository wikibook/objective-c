#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 가비지 컬렉션을 기동
    NSGarbageCollector *gc = [NSGarbageCollector defaultCollector];
    [gc enable];
    
    // 약한 참조 관계로 오브젝트를 보관하는 포인터 배열을 생성
    NSPointerArray *newArray;
    newArray = [NSPointerArray pointerArrayWithWeakObjects];
    
    // 오브젝트를 추가 
    NSString *item = @"CD";
    NSString *item2 = @"DVD";
    NSString *item3 = @"CD";

    [newArray addPointer:item];
    [newArray addPointer:item2];
    [newArray addPointer:item3];
    
    // 'CD'를 'NULL'로 치환 
    NSUInteger u;
    for (u = 0; u < [newArray count]; u++)
    {
        // 포인터 배열에서 오브젝트를 취득
        NSString *str = [newArray pointerAtIndex:u];
        // 취득한 문자열이 ‘CD’면 ‘NULL’로 치환
        if ([str isEqualTo:@"CD"])
        {
            [newArray replacePointerAtIndex:u
                                withPointer:NULL];
        }
    }

    NSLog(@"Before count = %u", [newArray count]);
    
    // ‘NULL’로 치환한 오브젝트를 한 번에 삭제
    [newArray compact];
    
    NSLog(@"After count  = %u", [newArray count]);
    
    // 소멸처리를 함 
    [gc collectIfNeeded];
    [gc collectExhaustively];
    
    [pool drain];
    return 0;
}
