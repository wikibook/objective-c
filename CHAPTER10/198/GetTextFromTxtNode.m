#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 파일을 트리 구조 방식으로 읽어옴
    // 아래 경로는 알맞게 변경해주세요
    // 여기에서는 ‘/Users/gaheeyoon/Test.xml’을 읽어옴
    NSURL *url = [NSURL fileURLWithPath:@"/Users/gaheeyoon//Test.xml"];
    NSXMLDocument *domDoc;
    
    domDoc = [[[NSXMLDocument alloc]
               initWithContentsOfURL:url
               options:0
               error:NULL] autorelease];
    
    // 루트 엘리먼트를 취득
    NSXMLElement *element = [domDoc rootElement];
    
    // 텍스트 노드를 취득
    // 첫 번째 자식 노드를 재귀적으로 취득
    NSXMLNode *node = element;
    
    while (1)
    {
        // 자식 노드가 있는지 조사
        if ([node childCount] > 0)
        {
            // 첫 번째 자식 노드를 취득
            node = [node childAtIndex:0];
            
            // 취득한 노드가 텍스트 노드라면 루프를 종료
            if ([node kind] == NSXMLTextKind)
            {
                break;
            }
        }
        else
        {
            node = nil;
            break;
        }
    }
    
    // 텍스트 노드를 취득했으면 텍스트를 취득
    if (node)
    {
        NSString* text = [node stringValue];
        
        NSLog(@"text : %@", text);
    }
    
    [pool drain];
    return 0;
}
