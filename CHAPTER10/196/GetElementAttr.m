#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 파일을 트리구조 방식으로 읽어옴
    // 아래 경로는 알맞게 변경해주세요
    // 여기에서는 ‘/Users/gaheeyoon/Test.xml’을 읽어옴
    NSURL *url = [NSURL fileURLWithPath:@"/Users/gaheeyoon/Test.xml"];
    NSXMLDocument *domDoc;
    
    domDoc = [[[NSXMLDocument alloc]
               initWithContentsOfURL:url
               options:0
               error:NULL] autorelease];
    
    // 루트 엘리먼트를 취득 
    NSXMLElement *element = [domDoc rootElement];
    
    // 첫 번째 자식 노드를 취득 
    NSXMLNode *node = [element childAtIndex:0];
    
    // 엘리먼트인지 여부를 확인 
    if ([node kind] == NSXMLElementKind)
    {
        // 속성을 모두 취득 
        NSArray* attrNodes = [(NSXMLElement *)node attributes];
        
        // 고속열거로 각 노드를 취득 
        for (node in attrNodes)
        {
            NSLog(@"'%@' = '%@'", [node name], [node stringValue]);
        }
    }
    
    [pool drain];
    return 0;
}
