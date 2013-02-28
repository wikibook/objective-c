//
//  AppDelegate.h
//  MyRSSReader

#import <UIKit/UIKit.h>

// URL의 배열을 저장 하는 사용자 디폴트 키
extern NSString *RSSReaderURLStringArray;

@interface AppDelegate : NSObject
<UIApplicationDelegate, UITabBarControllerDelegate>
{
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet
UITabBarController *tabBarController;

@end
