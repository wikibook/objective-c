#import "MyObserver.h"

@implementation MyObserver

- (id)init
{
    self = [super init];
    if (self)
    {
        // ‘MyNotification’을 받게 설정
        // 여기에서는 통지를 받으면 ‘myNofitication:’ 메서드를 
        // 호출하도록 함
        NSNotificationCenter *center;
        
        center = [NSNotificationCenter defaultCenter];
        [center addObserver:self
                   selector:@selector(myNotification:)
                       name:@"MyNotification"
                     object:nil];
    }
    return self;
}

- (void)dealloc
{
    // 인스턴스가 소멸되기 전에 ‘통지센터’의 등록을 해제하지 않으면 안됨
    NSNotificationCenter *center;
    
    center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
    
    [super dealloc];
}

// 통지를 받았을 때 호출되는 메서드
- (void)myNotification:(NSNotification *)aNotification
{
    // 추가 정보를 취득
    NSDictionary *userInfo = [aNotification userInfo];
    NSString *str = [userInfo objectForKey:@"String"];
    
    NSLog(@"%@", str);
}

@end
