#import <Foundation/Foundation.h>

// 정렬에서 사용할 비교함수
// 파라미터 ‘context’ 가 ‘0’ 이면 오름차순 그 이외에는 내림차순으로 정렬
NSInteger stringSort(id str1, id str2, void *context)
{
    NSInteger ret = [str1 compare:str2];

    if (context)
    {
        // 여기에서는 내림차순으로 정렬
        // 내림차순 정렬은 ‘compare:’ 메서드의 반환값을 반전시킴
        if (ret == NSOrderedAscending)
            ret = NSOrderedDescending;
        else if (ret == NSOrderedDescending)
            ret = NSOrderedAscending;
    }
    return ret;
}

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 배열을 생성
    NSMutableArray *mutableArray;
    mutableArray = [NSMutableArray arrayWithObjects:
                @"Value1", @"Value4", @"Value3",
                @"Value2", @"Value6", @"Value5", nil];
    NSLog(@"srcArray=%@", mutableArray);
    
    // ‘NSMutableArray’ 클래스에서는 직접 배열에서 정렬할 수 있음 
    // 내림차순으로 정렬
    [mutableArray sortUsingFunction:stringSort
                            context:(void*)1];

    NSLog(@"mutableArray=%@", mutableArray);
    [pool drain];
    return 0;
}
