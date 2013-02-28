#import <Foundation/Foundation.h>

// カテゴリ定義
@interface NSXMLNode (MyAddition)

- (NSXMLNode *)nextNamedElement:(NSString *)name;

@end

@implementation NSXMLNode (MyAddition)

// 지정한 이름을 가진 다음 엘리먼트를 취득
- (NSXMLNode *)nextNamedElement:(NSString *)name
{
    // 다음 노드를 취득 
    NSXMLNode *ret = [self nextSibling];
    
    while (ret)
    {
        // 찾고 있는 엘리먼트인지 조사 
        if ([ret kind] == NSXMLElementKind &&
            [[ret name] isEqualToString:name])
        {
            break;
        }
        // 다음 노드를 취득 
        ret = [ret nextSibling];
    }
    
    return (NSXMLElement *)ret;
}

@end


int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // 파일을 트리 구조 방식으로 읽어옴
    // 아래 경로는 알맞게 변경해주세요
    NSURL *url = [NSURL fileURLWithPath:@"/Users/gaheeyoon/Test.xml"];
    NSXMLDocument *domDoc;
    
    domDoc = [[[NSXMLDocument alloc]
               initWithContentsOfURL:url
               options:0
               error:NULL] autorelease];
    
    // 루트 엘리먼트 취득 
    NSXMLElement *element = [domDoc rootElement];
    
    // 자식노드 취득 
    NSXMLNode *node = [element childAtIndex:0];
    
    // 다음 'user' 엘리먼트를 취득 
    node = [node nextNamedElement:@"user"];
    
    NSLog(@"%@", node);
    
    [pool drain];
    return 0;
}
