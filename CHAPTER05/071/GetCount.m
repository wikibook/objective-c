#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 오브젝트 수를 취득할 대상 컬렉션을 생성 
    // 배열 생성
    NSArray *theArray;
    theArray = [NSArray arrayWithObjects:
                @"Value1", @"Value2", @"Value3", nil];
    
    // 사전 생성
    NSDictionary *theDict;
    theDict = [NSDictionary dictionaryWithObjectsAndKeys:
               @"Value1", @"Key1",
               @"Value2", @"Key2",
               nil];
    
    // 세트 생성
    NSSet *theSet;
    theSet = [NSSet setWithObject:@"Value1"];
    
    // 인덱스세트 생성
    NSIndexSet *theIndexSet;
    NSRange range = NSMakeRange(5, 4);
    theIndexSet = [NSIndexSet indexSetWithIndexesInRange:range];
    
    // 각 컬렉션이 포함하고 있는 오브젝트 수를 취득
    NSUInteger theCount;
    
    // 배열의 오브젝트 수를 취득
    theCount = [theArray count];
    NSLog(@"Count of the array : %lu", (unsigned long)theCount);
    
    // 사전의 오브젝트 수를 취득
    theCount = [theDict count];
    NSLog(@"Count of the dictionary : %lu", (unsigned long)theCount);
    
    // 세트의 오브젝트 수를 취득
    theCount = [theSet count];
    NSLog(@"Count of the set : %lu", (unsigned long)theCount);
    
    // 인덱스세트의 엘리먼트 수를 취득
    theCount = [theIndexSet count];
    NSLog(@"Count of the index-set : %lu", (unsigned long)theCount);
    
    [pool drain];
    return 0;
}
