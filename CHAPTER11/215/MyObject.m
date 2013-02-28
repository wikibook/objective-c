#import "MyObject.h"

@implementation MyObject

- (void)logNow:(id)anObject
{
    // 현재 일시 취득 
    NSDate *date = [NSDate date];
    NSLog(@"%@", date);
}

@end
