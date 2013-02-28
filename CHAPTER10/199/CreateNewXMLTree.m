#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 루트 엘리먼트를 생성 
    NSXMLElement *rootElement;
    
    rootElement = [[[NSXMLElement alloc] initWithName:@"Root"]
                   autorelease];
    
    // 도큐먼트 트리를 생성 
    NSXMLDocument *domDoc;
    
    domDoc = [[[NSXMLDocument alloc] initWithRootElement:rootElement]
              autorelease];
    
    NSLog(@"%@", domDoc);
    
    [pool drain];
    return 0;
}
