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
    
    // 속성 추가
    // 속성 노드 생성
    NSXMLNode *attrNode;
    
    attrNode = [[[NSXMLNode alloc] initWithKind:NSXMLAttributeKind]
                autorelease];
    // 속성 이름 설정
    [attrNode setName:@"AttrName"];

    // 속성값 설정
    [attrNode setStringValue:@"AttrValue"];
    
    // 속성을 엘리먼트에 추가
    [element addAttribute:attrNode];
    
    NSLog(@"%@", domDoc);
    
    [pool drain];
    return 0;
}
