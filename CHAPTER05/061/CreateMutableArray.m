#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSMutableArray *theArray = nil;
    
    // 빈 배열 생성
    theArray = [NSMutableArray array];
    
    NSLog(@"%@", theArray);
    
    // 오브젝트가 하나만 있는 배열 생성
    // 여기에서는 문자열을 지정하고 있음
    theArray = [NSMutableArray arrayWithObject:@"String"];
    
    NSLog(@"%@", theArray);
    
    // 오브젝트를 열거해서 배열 생성
    // 마지막 오브젝트 뒤에 ‘nil’을 지정
    // 여기에서는 문자열을 세 개 지정하고 있음
    theArray = [NSMutableArray arrayWithObjects:@"String",
                @"String2", @"String3", nil];
    
    NSLog(@"%@", theArray);
    
    // 오브젝트를 c의 배열과 개수로 지정해서 배열을 생성 
    // 여기에서는 문자열을 세 개 지정하고 있음    
    NSString *theStrings[] = {
        @"A",
        @"B",
        @"C"
    };
    
    theArray = [NSMutableArray arrayWithObjects:theStrings
                                   count:3];
    
    NSLog(@"%@", theArray);
    
    // 내부 버퍼의 초기 사이즈를 지정해서 배열을 생성
    NSMutableArray *theMutableArray;
    theMutableArray = [NSMutableArray arrayWithCapacity:0];
    
    NSLog(@"%@", theMutableArray);

    [pool drain];
    return 0;
}