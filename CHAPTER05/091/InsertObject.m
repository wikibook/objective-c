#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 가변 배열을 생성 
    NSMutableArray *theArray;
    theArray = [NSMutableArray arrayWithObject:@"value"];
    
    // 오브젝트를 하나 삽입
    // 여기에서는 배열 제일 앞에 삽입하고 있음
    [theArray insertObject:@"value2"
                   atIndex:0];

    NSLog(@"%@", theArray);
    [pool drain];
    return 0;
}
