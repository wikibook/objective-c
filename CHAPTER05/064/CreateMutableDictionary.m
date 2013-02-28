#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 빈 사전을 생성
    NSMutableDictionary *dict;
    dict = [NSMutableDictionary dictionary];
    
    NSLog(@"%@", dict);
    
    // 오브젝트를 한 개만 포함하는 사전 생성
    // 첫 번째 파라미터에 포함할 오브젝트를 지정하고
    // 파라미터 ‘forkey’에 키 지정
    dict = [NSMutableDictionary dictionaryWithObject:@"Value1"
                                              forKey:@"Key1"];
    NSLog(@"%@", dict);
    
    // 오브젝트와 키를 열거해 사전을 생성
    // 오브젝트, 키 순서로 열거하고 마지막 키 뒤에 ‘nil’을 기술
    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
            @"Value1", @"Key1",
            @"Value2", @"Key2",
            @"Value3", @"Key3",
            nil];
    NSLog(@"%@", dict);
    
    // 오브젝트와 키를 C의 배열로 지정한 사전을 생성
    NSString *keysBuf[] = {
        @"Key1", @"Key2", @"Key3"
    };
    NSString *valuesBuf[] = {
        @"Value1", @"Value2", @"Value3",
    };
    dict = [NSMutableDictionary dictionaryWithObjects:valuesBuf
                                              forKeys:keysBuf
                                                count:3];
    NSLog(@"%@", dict);
    
    // 오브젝트와 키를 배열로 지정해서 사전을 생성
    NSArray *keysArray = [NSArray arrayWithObjects:
                          @"Key1", @"Key2", @"Key3", nil];
    NSArray *valuesArray = [NSArray arrayWithObjects:
                            @"Value1", @"Value2", @"Value3", nil];
    dict = [NSMutableDictionary dictionaryWithObjects:valuesArray
                                              forKeys:keysArray];
    NSLog(@"%@", dict);
    
    // 내부 버퍼의 초기 사이즈를 지정해서 사전을 생성
    dict = [NSMutableDictionary dictionaryWithCapacity:0];
    
    NSLog(@"%@", dict);
    
    [pool drain];
    return 0;
}
