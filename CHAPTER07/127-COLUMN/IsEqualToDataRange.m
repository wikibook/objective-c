#import <Foundation/Foundation.h>

// 카테고리를 정의 
@interface NSData (MyAddition)
- (BOOL)isEqualToData:(NSData *)data inRange:(NSRange)range;
@end

@implementation NSData (MyAddition)

// 파라미터 ‘inRange’에서 지정한 범위를 비교
- (BOOL)isEqualToData:(NSData *)data inRange:(NSRange)range
{
    BOOL ret = NO;
    
    // 지정된 범위가 유효한 범위인지 조사 
    if (range.length > 0 &&                     // 범위의 길이가 유효인가
        NSMaxRange(range) <= [self length] &&   // 초과하지 않는가
        NSMaxRange(range) <= [data length])     // 초과하지 않는가
    {
        // 지정된 범위를 비교 
        if (memcmp((unsigned char *)[self bytes] + range.location,
                   (unsigned char *)[data bytes] + range.location,
                   range.length) == 0)
        {
            ret = YES;
        }
            
    }
    return ret;
}

@end

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    NSData *data1 = [NSData dataWithBytes:"ABCD" length:4];
    NSData *data2 = [NSData dataWithBytes:"zBC2D" length:5];
    
    if ([data1 isEqualToData:data2 inRange:NSMakeRange(1, 2)])
        NSLog(@"YES");
    else
        NSLog(@"NO");
    
    [pool drain];
    return 0;
}
