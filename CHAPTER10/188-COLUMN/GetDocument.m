#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // 파일에서 트리구조 방식으로 읽어옴
    // 아래 경로는 알맞게 변경해주세요
    NSURL *url = [NSURL fileURLWithPath:@"/Users/gaheeyoon/Test.xml"];
    NSXMLDocument *domDoc;
    
    domDoc = [[[NSXMLDocument alloc]
               initWithContentsOfURL:url
               options:0
               error:NULL] autorelease];
    
    // 루트 엘리먼트 취득
    NSXMLElement *element = [domDoc rootElement];
    
    // 루트 엘리먼트의 부모 노드는 도큐먼트 노드
    NSXMLNode *parent = [element parent];
    NSLog(@"parent = %@", [parent class]);

    [pool drain];
    return 0;
}
