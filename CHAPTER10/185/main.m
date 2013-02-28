#import <Foundation/Foundation.h>
#import "MyXMLDelegate.h"

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // XML 파일에서 읽어옴
    // 아래 경로는 알맞게 변경해주세요
    // 여기에서는 ‘/Users/gaheeyoon/Test.xml’을 읽어옴
    NSURL *url = [NSURL fileURLWithPath:@"/Users/gaheeyoon/Test.xml"];
    NSXMLParser *parser = [[[NSXMLParser alloc]
                            initWithContentsOfURL:url] autorelease];
    
    // 이벤트를 받아들이는 클래스의 인스턴스 생성
    MyXMLDelegate *delegate = [[[MyXMLDelegate alloc]
                                init] autorelease];
    
    // 이벤트를 받아들일 수 있게 설정
    [parser setDelegate:delegate];
    
    // 해석시작
    [parser parse];
    
    [pool drain];
    return 0;
}
