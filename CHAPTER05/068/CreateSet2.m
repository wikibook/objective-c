#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 원본 세트 생성
    NSSet *srcSet;
    srcSet = [NSSet setWithObjects:
              @"Value1", @"Value2", @"Value3", nil];
    
    // 세트를 복제
    NSSet *theSet = [NSSet setWithSet:srcSet];
    
    NSLog(@"%@", theSet);
    
    [pool drain];
    return 0;
}
