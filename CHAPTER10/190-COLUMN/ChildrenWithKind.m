#import <Foundation/Foundation.h>

@interface NSXMLNode (MyAddition)

- (NSArray *)childrenWithKind:(NSXMLNodeKind)kind;

@end

@implementation NSXMLNode (MyAddition)

// 지정한 종류의 노드를 분류해 반환
- (NSArray *)childrenWithKind:(NSXMLNodeKind)kind
{
    // 자식 노드를 취득
    NSArray *children = [self children];
    
    // 종류에 따라 분류
    NSMutableArray *ret = [NSMutableArray array];
    NSEnumerator *enumerator = [children objectEnumerator];
    NSXMLNode *node;
    
    while (node = [enumerator nextObject])
    {
        // 지정된 종류의 노드라면 배열에 추가
        if ([node kind] == kind)
            [ret addObject:node];
    }
    
    return ret;
}

@end


int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 파일에서 트리 구조 방식으로 읽어옴
    // 아래 경로는 알맞게 변경해주세요
    NSURL *url = [NSURL fileURLWithPath:@"/Users/gaheeyoon/Test.xml"];
    NSXMLDocument *domDoc;
    
    domDoc = [[[NSXMLDocument alloc]
               initWithContentsOfURL:url
               options:0
               error:NULL] autorelease];
    
    // 루트 엘리먼트 취득
    NSXMLElement *element = [domDoc rootElement];
    
    // 루트 엘리먼트의 자식 노드를 모두 취득
    NSArray *children = [element childrenWithKind:NSXMLElementKind];
    
    NSLog(@"%@", children);
    
    [pool drain];
    return 0;
}
