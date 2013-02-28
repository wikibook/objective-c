#import <Foundation/Foundation.h>

// 카테고리 정의 
@interface NSXMLElement (MyAddition)

- (NSXMLElement *)addChildElementWithName:(NSString *)name;

@end

@implementation NSXMLElement (MyAddition)

// 지정한 이름의 엘리먼트를 생성해 파라미터 ‘inNode’의 자식 노드로 추가
- (NSXMLElement *)addChildElementWithName:(NSString *)name
{
    // 엘리먼트 생성
    NSXMLElement *element = [[[NSXMLElement alloc]
                              initWithName:name] autorelease];
    // 자식 노드로 추가
    [self addChild:element];
    
    // 생성한 엘리먼트 반환
    return element;
}
@end


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
    
    // 루트 엘리먼트에 자식 엘리먼트 추가 
    NSXMLElement *element;
    element = [rootElement addChildElementWithName:@"child"];
    
    NSLog(@"%@", domDoc);
    
    [pool drain];
    return 0;
}
