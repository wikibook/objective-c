#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSMutableSet *theSet;
    
    // 빈 세트를 생성
    theSet = [NSMutableSet set];
    
    NSLog(@"%@", theSet);
    
    // 오브젝트를 한 개만 포함한 세트를 생성
    theSet = [NSMutableSet setWithObject:@"Value1"];
    
    // 포함할 오브젝트를 열거해 세트를 생성
    // 마지막 오브젝트 뒤에 ‘nil’을 기술
    theSet = [NSMutableSet setWithObjects:@"Value1", @"Value2", nil];
    NSLog(@"%@", theSet);
    
    // 포함할 오브젝트를 배열로 지정해 세트를 생성
    NSArray *theArray;
    theArray = [NSArray arrayWithObjects:@"Value1", @"Value2", nil];
    theSet = [NSMutableSet setWithArray:theArray];
    
    NSLog(@"%@", theSet);
    
    // 포함할 오브젝트를 C의 배열로 지정해 세트를 생성
    NSString *theValuesBuf[] = {
        @"Value1", @"Value2"
    };
    theSet = [NSMutableSet setWithObjects:theValuesBuf
                                    count:2];
    NSLog(@"%@", theSet);
    
    [pool drain];
    return 0;
}
