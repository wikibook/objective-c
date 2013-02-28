#import <Foundation/Foundation.h>

// 카테고리 정의 
@interface NSXMLNode (MyAddition)
- (NSUInteger)childElementCount;
@end

@implementation NSXMLNode (MyAddition)

- (NSUInteger)childElementCount
{
    NSUInteger ret = 0;
    
    // 자식 노드를 취득 
    NSArray *children = [self children];
    
    // 노드를 순서대로 취득 
    NSEnumerator *enumerator = [children objectEnumerator];
    NSXMLNode *node;
    
    while (node = [enumerator nextObject])
    {
        // 엘리먼트인지 아닌지를 확인 
        if ([node kind] == NSXMLElementKind)
            ret++;
    }
    return ret;
}

@end

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 파일을 트리 구조 방식으로 읽어옴
    // 아래 경로는 알맞게 변경해주세요
    // 여기에서는 ‘/Users/gaheeyoon/Test.xml’을 읽어옴
    NSURL *url = [NSURL fileURLWithPath:@"/Users/gaheeyoon/Test.xml"];
    NSXMLDocument *domDoc;
    
    domDoc = [[[NSXMLDocument alloc]
               initWithContentsOfURL:url
               options:NSXMLDocumentTidyXML
               error:NULL] autorelease];
    
    // 루트 엘리먼트를 취득
    NSXMLElement *element = [domDoc rootElement];
    
    // 루트 엘리먼트의 자식 노드 개수를 취득
    NSUInteger count = [element childElementCount];
    
    NSLog(@"childElementCount : %lu", (unsigned long)count);
    
    [pool drain];
    return 0;
}
