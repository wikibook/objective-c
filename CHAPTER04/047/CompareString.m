#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 비교할 문자열 생성
    NSString *strs[] = {
        [NSString stringWithString:@"Book"],
        [NSString stringWithString:@"book"],
        [NSString stringWithString:@"Air"],
        [NSString stringWithString:@"case"]
    };
    
    /// 두 문자가 일치하는지 조사
    // ‘isEqual:’ 메서드는 내부에서 인스턴스가 문자열인지 조사해서
    // 문자열이라면 ‘isEqualToString:’ 메서드로 문자열이 일치하는지 조사
    // ‘isEqualToString:’ 메서드는 일치할 때는 ‘YES’ 일치하지 않을 때는 ‘NO’를 반환
    // ‘isEqualToString:’ 메서드는 대문자, 소문자를 구별함
    int i;
    
    for (i = 0; i < 4; i++)
    {
        BOOL b = [strs[0] isEqualToString:strs[i]];
        NSLog(@"[%@ isEqualToString:%@] = %d",
              strs[0], strs[i], b);
    }
    
    // 두 문자열을 대문자, 소문자로 구별해서 비교
    // ‘compare:’ 메서드는 문자열을 비교해서 문자열이 일치할 때는 ‘NSOrderedSame’을 반환 
    // 파라미터로 전달된 문자열 순서가 오름차순일 때는 ‘NSOrderedAscending’을 반환
    // 그 이외에는 ‘NSOrderedDescending’을 반환
    for (i = 0; i < 4; i++)
    {
        NSComparisonResult res = [strs[0] compare:strs[i]];
        NSString *resStr = nil;
        switch (res)
        {
            case NSOrderedSame:
                resStr = @"NSOrderedSame";
                break;
            case NSOrderedAscending:
                resStr = @"NSOrderedAscending";
                break;
            case NSOrderedDescending:
                resStr = @"NSOrderedDescending";
                break;
        }
        NSLog(@"[%@ compare:%@] = %@",
              strs[0], strs[i], resStr);
    }
    
    // 두 문자열을 대문자, 소문자 구별하지 않고 비교
    // ‘caseInsensitiveCompare:’ 메서드는 문자열을 비교해서
    // 문자열이 일치할 때는 ‘NSOrderedSame’을 반환
    // 파라미터로 전달된 문자열 순서가 오름차순일 때는 ‘NSOrderedAscending’을 반환 
    // 그 이외에는 ‘NSOrderedDescending’을 반환
    for (i = 0; i < 4; i++)
    {
        NSComparisonResult res = [strs[0] caseInsensitiveCompare:strs[i]];
        NSString *resStr = nil;
        switch (res)
        {
            case NSOrderedSame:
                resStr = @"NSOrderedSame";
                break;
            case NSOrderedAscending:
                resStr = @"NSOrderedAscending";
                break;
            case NSOrderedDescending:
                resStr = @"NSOrderedDescending";
                break;
        }
        NSLog(@"[%@ compare:%@] = %@",
              strs[0], strs[i], resStr);
    }
    
    
    [pool drain];
    return 0;
}
