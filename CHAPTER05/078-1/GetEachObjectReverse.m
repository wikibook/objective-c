#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 배열 생성
    NSArray *theArray = [NSArray arrayWithObjects:
                         @"Value1",
                         @"Value2",
                         @"Value3",
                         @"Value4",
                         @"Value5",
                         nil];
    
    // 뒤에서부터 순서대로 오브젝트를 취득하는 열거자를 생성 
    NSEnumerator *enumerator = [theArray reverseObjectEnumerator];
    id value;
    
    // 오브젝트를 순서대로 취득
    // 뒤에서부터 취득하는 열거자이므로 역순으로 오브젝트를 취득
    // 첫 번째 오브젝트까지 취득하면 ‘nextObejct’ 메서드가 ‘nil’을 반환 
    // 이런 방식으로 첫 번째 오브젝트를 취득할 때까지 반복
    while (value = [enumerator nextObject])
    {
        NSLog(@"%@", value);
    }
    
    [pool drain];
    return 0;
}

