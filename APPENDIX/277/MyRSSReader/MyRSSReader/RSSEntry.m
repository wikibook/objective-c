//
//  RSSEntry.m
//  MyRSSReader
//

#import "RSSEntry.h"

@implementation RSSEntry
@synthesize url = _url;
@synthesize title = _title;
@synthesize text = _text;
@synthesize date = _date;

- (id)init
{
    self = [super init];
    if (self)
    {
        _url = nil;
        _title = nil;
        _text = nil;
        _date = nil;
    }
    return self;
}

- (void)dealloc
{
    [_url release];
    _url = nil;
    [_title release];
    _title = nil;
    [_text release];
    _text = nil;
    [_date release];
    _date = nil;
    [super dealloc];
}

@end
