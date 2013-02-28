#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 파일을 트리 구조방식으로 읽어옴
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
    
    NSLog(@"%@", node);
    
    // 같은 레벨의 다음 노드를 취득
    node = [node nextSibling];
    
    NSLog(@"%@", node);
    
    // 같은 레벨의 이전 노드를 취득
    // 여기에서는 두번째 노드의 하나 앞이므로 첫 번째 노드를 반환
    node = [node previousSibling];
    
    NSLog(@"%@", node);
    
    [pool drain];
    return 0;
}
