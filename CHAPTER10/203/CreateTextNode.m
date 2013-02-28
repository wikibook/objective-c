#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // 루트 엘리먼트 생성
    NSXMLElement *rootElement;
    
    rootElement = [[[NSXMLElement alloc] initWithName:@"Root"]
                   autorelease];
    
    // 도큐먼트 트리 생성
    NSXMLDocument *domDoc;
    
    domDoc = [[[NSXMLDocument alloc] initWithRootElement:rootElement]
              autorelease];
    
    // 엘리먼트 생성
    NSXMLElement* element;
    
    element = [[[NSXMLElement alloc] initWithName:@"Value"]
               autorelease];
    
    // 루트 엘리먼트에 추가
    [rootElement addChild:element];
    
    // 텍스트 노드 생성
    NSXMLNode *textNode;
    
    textNode = [[[NSXMLNode alloc] initWithKind:NSXMLTextKind]
                autorelease];
    
    // 텍스트 설정
    [textNode setStringValue:@"Text"];
    
    // 엘리먼트의 자식 노드로 추가
    [element addChild:textNode];
    
    NSLog(@"%@", domDoc);
    
    [pool drain];
    return 0;
}