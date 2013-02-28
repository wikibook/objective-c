#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // 단위행렬을 생성 
    NSAffineTransform *at = [NSAffineTransform transform];
    
    // 두 배 확대 
    [at scaleBy:2.0f];
    
    // 좌표를 적용 
    NSPoint pt1 = NSMakePoint(5, 10);
    NSPoint pt2 = [at transformPoint:pt1];
    
    NSLog(@"{%f,%f} => {%f,%f}",
          pt1.x, pt1.y, pt2.x, pt2.y);
    
    // 사이즈를 적용 
    NSSize sz = NSMakeSize(10, 20);
    NSSize sz2 = [at transformSize:sz];
    
    NSLog(@"{%f,%f} => {%f,%f}",
          sz.width, sz.height, sz2.width, sz2.height);
    
    [pool drain];
    return 0;
}
