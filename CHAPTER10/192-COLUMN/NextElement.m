#import <Foundation/Foundation.h>

// 카테고리 정의
@interface NSXMLNode (MyAddition)

- (NSXMLElement *)nextSiblingElement;

@end

@implementation NSXMLNode (MyAddition)

// 다음 엘리먼트를 취득 
- (NSXMLElement *)nextSiblingElement
{
    // 다음 노드를 취득 
    NSXMLNode *ret = [self nextSibling];
    
    while (ret)
    {
        // 엘리먼트인지 확인 
        if ([ret kind] == NSXMLElementKind)
            break;
        // 다음 노드를 취득 
        ret = [ret nextSibling];
    }

    return (NSXMLElement *)ret;
}

@end


int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // 파일을 트리 구조방식으로 읽어옴
    // 아래 경로는 알맞게 변경해주세요
    NSURL *url = [NSURL fileURLWithPath:@"/Users/gaheeyoon/Test.xml"];
    NSXMLDocument *domDoc;
    
    domDoc = [[[NSXMLDocument alloc]
               initWithContentsOfURL:url
               options:0
               error:NULL] autorelease];
    
    // 루트 엘리먼트를 취득 
    NSXMLElement *element = [domDoc rootElement];
    
    // 자식 노드를 취득 
    NSXMLNode *node = [element childAtIndex:0];
    
    // 다음 엘리먼트를 취득 
    node = [node nextSiblingElement];
    
    NSLog(@"%@", node);
    
    [pool drain];
    return 0;
}
