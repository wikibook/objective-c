#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 배열을 생성
    // 각 오브젝트는 KVC의 키로 취득되므로 사전 배열로 생성    
    NSMutableArray *array;
    array = [NSMutableArray arrayWithObjects:
                [NSDictionary dictionaryWithObject:@"Value1"
                                            forKey:@"key"],
                [NSDictionary dictionaryWithObject:@"Value4"
                                            forKey:@"key"],
                [NSDictionary dictionaryWithObject:@"Value3"
                                            forKey:@"key"],
                [NSDictionary dictionaryWithObject:@"Value2"
                                            forKey:@"key"],
                [NSDictionary dictionaryWithObject:@"Value6"
                                            forKey:@"key"],
                [NSDictionary dictionaryWithObject:@"Value5"
                                            forKey:@"key"],
                nil];
    
    NSLog(@"array=%@", array);
        
    // ‘NSMutableArray’ 클래스는 배열에서 직접 정렬할 수 있음 
    // 여기에서는 내림차순으로 정렬하고 있음
    // 내림차순으로 정렬하는 ‘NSSortDescriptor’ 클래스는
    // 이니셜라이져의 파라미터 ‘ascending’에 ‘NO’를 지정
    NSSortDescriptor *sortDesc;
    sortDesc = [[[NSSortDescriptor alloc] initWithKey:@"key"
                                            ascending:NO]
                autorelease];
    
    // 배열에 저장 
    NSArray *sortDescArray;
    sortDescArray = [NSArray arrayWithObject:sortDesc];

    [array sortUsingDescriptors:sortDescArray];
    
    NSLog(@"array=%@", array);
    [pool drain];
    return 0;
}