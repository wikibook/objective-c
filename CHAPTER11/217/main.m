#import <Foundation/Foundation.h>
#import "MyObject.h"
#import "MySubObject.h"

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // インスタンスを作成する
    MySubObject *obj = [[[MySubObject alloc] init] autorelease];
    
    // メソッドを呼び出す
    [obj checkMethod];
    
    [pool drain];
    return 0;
}
