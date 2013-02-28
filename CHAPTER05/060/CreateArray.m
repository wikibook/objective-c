#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSArray *theArray = nil;
    
    // 빈 배열을 생성
    theArray = [NSArray array];
    
    NSLog(@"%@", theArray);
    
    // 오브젝트가 하나만 있는 배열을 생성
    // 여기에서는 문자열을 지정하고 있음
    theArray = [NSArray arrayWithObject:@"String"];
    
    NSLog(@"%@", theArray);
    
    // 오브젝트를 열거해 배열을 생성
    // 마지막의 오브젝트 뒤에는 ‘nil’을 지정
    // 여기에서는 문자열을 세 개 지정하고 있음
    theArray = [NSArray arrayWithObjects:@"String",
                @"String2", @"String3", nil];
    
    NSLog(@"%@", theArray);
    
    // 오브젝트를 c의 배열과 개수로 지정해서 배열을 생성 
    // 여기에서는 문자열을 세 개 지정하고 있음    
    NSString *theStrings[] = {
        @"A",
        @"B",
        @"C"
    };
    
    theArray = [NSArray arrayWithObjects:theStrings
                                   count:3];
    
    NSLog(@"%@", theArray);
        
    [pool drain];
    return 0;
}