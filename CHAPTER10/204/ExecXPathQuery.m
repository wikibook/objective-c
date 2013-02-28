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
    
    // XPath의 쿼리로 노드 취득
    // 여기에서는 ‘name’엘리먼트 취득
    NSString *query = @"//name";
    NSError *err = nil;
    NSArray *nodes;
    
    nodes = [domDoc nodesForXPath:query
                            error:&err];
    
    NSLog(@"%@", nodes);
    
    [pool drain];
    return 0;
}