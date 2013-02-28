#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 배열을 생성
    // 각 오브젝트는 KVC의 키로 취득되므로 사전 배열을 생성
    NSArray *srcArray;
    srcArray = [NSArray arrayWithObjects:
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
    
    NSLog(@"srcArray=%@", srcArray);
        
    // 정렬의 설정
    // 키 ‘key’에서 취득한 오브젝트를 오름차순으로 정렬
    NSSortDescriptor *sortDesc;
    sortDesc = [[[NSSortDescriptor alloc] initWithKey:@"key"
                                            ascending:YES]
                autorelease];
    
    // 정렬 기술 클래스의 인스턴스 배열을 생성
    // 여기에서는 한 개만 기술되지만 여러 개를 설정하고 싶을 때는
    // 여기에 여러 개의 ‘NSSortDescriptor’ 클래스 인스턴스를 배열에 포함시킴 
    // 배열의 처음과 가까운 오브젝트부터 먼저 사용되며 오브젝트가 같을 때는 
    // 배열에서 ‘NSSortDescriptor’ 클래스의 인스턴스를 사용해 정렬
    NSArray *sortDescArray;
    sortDescArray = [NSArray arrayWithObject:sortDesc];
    
    // 정렬을 함 
    NSArray *newArray;
    newArray = [srcArray sortedArrayUsingDescriptors:sortDescArray];
    
    NSLog(@"newArray=%@", newArray);
    [pool drain];
    return 0;
}