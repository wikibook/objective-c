#import <Foundation/Foundation.h>

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
               options:0
               error:NULL] autorelease];
    
    // 루트 엘리먼트 취득
    NSXMLElement *element = [domDoc rootElement];
    
    // 노드의 종류 취득
    // 변수 ‘element’는 엘리먼트이므로 ‘NSXMLElementKind’가 반환됨
    NSXMLNodeKind kind = [element kind];
    
    if (kind == NSXMLElementKind)
        NSLog(@"kind : NSXMLElementKind");
    
    [pool drain];
    return 0;
}
