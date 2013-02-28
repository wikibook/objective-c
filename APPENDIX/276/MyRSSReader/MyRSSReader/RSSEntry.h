//
//  RSSEntry.h
//  MyRSSReader
//

#import <Foundation/Foundation.h>


@interface RSSEntry : NSObject {
    NSURL       *_url;
    NSDate      *_date;
    NSString    *_title;
    NSString    *_text;
}
@property (retain) NSURL *url;
@property (retain) NSString *title;
@property (retain) NSString *text;
@property (retain) NSDate *date;
@end
