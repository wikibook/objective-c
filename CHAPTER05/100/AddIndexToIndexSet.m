#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 빈 인덱스세트를 생성 
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    
    // 값을 추가 
    [indexSet addIndex:10];
    NSLog(@"%@", indexSet);
    
    [pool drain];
    return 0;
}
