#import <Foundation/Foundation.h>

// 정렬에 사용할 비교함수
// 파라미터 ‘context’가 ‘0’이면 오름차순 그 이외에는 내림차순으로 정렬
NSInteger stringSort(id str1, id str2, void *context)
{
    NSInteger ret = [str1 compare:str2];

    if (context)
    {
        // 여기에서는 내림차순
        // 내림차순일 때는 ‘compare:’ 메서드의 반환값을 반전시킴
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
    NSArray *srcArray;
    srcArray = [NSArray arrayWithObjects:
                @"Value1", @"Value4", @"Value3",
                @"Value2", @"Value6", @"Value5", nil];
    
    NSLog(@"srcArray=%@", srcArray);
    
    // 비교함수를 전달해 정렬
    // 오름차순인지 내림차순인지 파라미터 ‘context’로 비교함수에 전달 
    // 여기에서는 오름차순으로 정렬
    NSArray *newArray;
    newArray = [srcArray sortedArrayUsingFunction:stringSort
                                          context:0];
    NSLog(@"newArray=%@", newArray);
    [pool drain];
    return 0;
}
