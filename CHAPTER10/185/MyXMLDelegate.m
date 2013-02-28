#import "MyXMLDelegate.h"

@implementation MyXMLDelegate

// 도큐먼트 시작
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"*** Start Document ***");
}

// 도큐먼트 종료
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"*** End Document ***");
}

// 엘리먼트 시작
- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict
{
    NSLog(@"*** Start Element (%@) ***", elementName);
}

// 엘리먼트 종료
- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)name
{
    NSLog(@"*** END Element (%@) ***", elementName);
}

// 문자열 읽어오기
- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string
{
    NSLog(@"Found Characters : '%@'", string);
}

@end
