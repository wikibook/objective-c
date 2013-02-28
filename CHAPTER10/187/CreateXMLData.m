#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 파일에서 트리 구조 방식으로 읽어옴
    // 아래 경로는 알맞게 변경해주세요
    // 여기에서는 ‘/Users/gaheeyoon/Test.xml’을 읽어옴
    NSURL *url = [NSURL fileURLWithPath:@"/Users/gaheeyoon/Test.xml"];
    NSXMLDocument *domDoc;
    
    domDoc = [[[NSXMLDocument alloc]
               initWithContentsOfURL:url
               options:0
               error:NULL] autorelease];
    
    // XML 텍스트 데이터를 생성
    // 여기에서는 도큐먼트 트리를 변경하지 않으므로 
    // ‘/Users/gaheeyoon/Test.xml’과 같은 XML 데이터가 생성됨
    NSData *xmlData = [domDoc XMLData];
    
    // 문자열화해 로그에 출력
    NSString *xmlStr = [[[NSString alloc]
                         initWithData:xmlData
                         encoding:NSUTF8StringEncoding]
                        autorelease];
    NSLog(@"%@", xmlStr);
    
    [pool drain];
    return 0;
}