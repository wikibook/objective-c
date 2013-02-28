//
//  RSSParser.h
//  MyRSSReader
//

#import <Foundation/Foundation.h>

@class RSSEntry;
@interface RSSParser : NSObject <NSXMLParserDelegate> {
    // RSS 게시물 배열 
    // 배열 내의 엘리먼트는 'RSSEntry' 클래스의 인스턴스가 됨 
    NSMutableArray  *_entries;
    
    // 분석중인 정보를 저장할 멤버 
    NSMutableArray  *_elementStack;
    RSSEntry        *_curEntry;
}
@property (retain) NSArray *entries;

- (BOOL)parseContentsOfURL:(NSURL *)url;
- (NSDate *)pubDateWithString:(NSString *)string;

@end
