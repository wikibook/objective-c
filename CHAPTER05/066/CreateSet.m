#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSSet *theSet;
    
    // 빈 세트를 생성
    theSet = [NSSet set];

    NSLog(@"%@", theSet);
    
    // 오브젝트를 한 개만 넣은 세트를 생성
    theSet = [NSSet setWithObject:@"Value1"];
    
    // 포함할 오브젝트를 열거해 세트를 생성 
    // 마지막 오브젝트 뒤에 ‘nil’을 기술함
    theSet = [NSSet setWithObjects:
              @"Value1", @"Value2", @"Value3", nil];
    NSLog(@"%@", theSet);
    
    // 포함할 오브젝트를 배열에서 지정해 세트를 생성
    NSArray *theArray;
    theArray = [NSArray arrayWithObjects:
                @"Value1", @"Value2", @"Value3", nil];
    theSet = [NSSet setWithArray:theArray];

    NSLog(@"%@", theSet);
    
    // 포함할 오브젝트를 C의 배열로 지정해 세트를 생성
    NSString *theValuesBuf[] = {
        @"Value1", @"Value2", @"Value3"
    };
    theSet = [NSSet setWithObjects:theValuesBuf
                             count:3];
    NSLog(@"%@", theSet);
    
    [pool drain];
    return 0;
}
