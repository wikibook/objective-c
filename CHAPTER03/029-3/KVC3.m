#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 연산할 배열을 생성
    // 여기에서는 {0, 1, 2,, ... , 8, 9} 라는 배열과
    // {4, 5, 6, ... , 12, 13} 이라는 배열을 생성
    NSMutableArray *theArray = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *theArray2 = [NSMutableArray arrayWithCapacity:0];
    NSInteger i;
    for (i = 0; i < 10; i++)
    {
        NSNumber *num = [NSNumber numberWithInteger:i];
        NSDictionary* dict;
        
        dict = [NSDictionary dictionaryWithObject:num
                                           forKey:@"Value"];
        [theArray addObject:dict];
        
        num = [NSNumber numberWithInteger:(i + 4)];
        dict = [NSDictionary dictionaryWithObject:num
                                           forKey:@"Value"];
        [theArray2 addObject:dict];        
    }
    
    // 생성된 두 개의 배열을 가진 배열을 생성
    NSArray *parentArray = [NSArray arrayWithObjects:theArray,
                            theArray2, nil];

    // 평균값을 구함 
    NSLog(@"@avg=%@", [theArray valueForKeyPath:@"@avg.Value"]);
    
    // 엘리먼트 개수를 구함
    NSLog(@"@count=%@", [theArray valueForKeyPath:@"@count.Value"]);
    
    // 최대값을 구함 
    NSLog(@"@max=%@", [theArray valueForKeyPath:@"@max.Value"]);
    
    // 최소값을 구함 
    NSLog(@"@min=%@", [theArray valueForKeyPath:@"@min.Value"]);
    
    // 합계를 계산 
    NSLog(@"@sum=%@", [theArray valueForKeyPath:@"@sum.Value"]);
    
    // Value의 배열을 생성 
    NSLog(@"@distinctUnionOfObjects=%@",
          [theArray valueForKeyPath:
            @"@distinctUnionOfObjects.Value"]);
    
    // 두 배열을 합친 배열을 생성 
    NSLog(@"@distinctUnionOfArrays=%@",
          [[parentArray valueForKeyPath:
            @"@distinctUnionOfArrays.Value"] description]);

    [pool drain];
    return 0;
}
