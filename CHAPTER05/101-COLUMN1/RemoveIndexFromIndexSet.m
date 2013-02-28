#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 인덱스세트를 생성 
    NSMutableIndexSet *indexSet;
    indexSet = [NSMutableIndexSet indexSetWithIndexesInRange:
                NSMakeRange(0, 10)];
    
    NSLog(@"%@", indexSet);
    
    // 범위를 지정해 값을 삭제 
    [indexSet removeIndexesInRange:NSMakeRange(7, 2)];
    NSLog(@"%@", indexSet);
	
    [pool drain];
    return 0;
}
