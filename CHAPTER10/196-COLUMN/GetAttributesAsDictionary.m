#import <Foundation/Foundation.h>

// 카테고리 정의
@interface NSXMLElement (MyAddition)

- (NSDictionary *)attributesAsDictionary;

@end

@implementation NSXMLElement (MyAddition)
// 엘리먼트의 속성을 사전으로 반환
- (NSDictionary *)attributesAsDictionary
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    // 노드의 종류를 조사
    if ([self kind] == NSXMLElementKind)
    {
        // 속성을 취득
        NSArray *attributes = [self attributes];

        // 속성을 하나씩 꺼내서 사전에 등록
        NSEnumerator *enumerator = [attributes objectEnumerator];
        NSXMLNode *node;
        while (node = [enumerator nextObject])
        {
            // 속성의 이름을 키로 등록
            [dict setObject:[node stringValue]
                     forKey:[node name]];
        }
    }
    return dict;
}
@end

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // 파일 읽어들임
        // 아래 경로는 알맞게 변경해주세요
    NSURL *url = [NSURL fileURLWithPath:@"/Users/gaheeyoon//Test.xml"];
    NSXMLDocument *domDoc;
    
    domDoc = [[[NSXMLDocument alloc]
               initWithContentsOfURL:url
               options:0
               error:NULL] autorelease];
    
    // 루트 엘리먼트 취득 
    NSXMLElement *element = [domDoc rootElement];
    
    // 첫번째 자식노드 취득 
    NSXMLNode *node = [element childAtIndex:0];
    
    // 속성을 사전으로 취득 
    NSDictionary *dict;
    dict = [(NSXMLElement *)node attributesAsDictionary];
    
    NSLog(@"%@", dict);
    
    [pool drain];
    return 0;
}
