//
//  AppDelegate.m
//  MyRSSReader
//

#import "AppDelegate.h"

#import "RSSListView.h"

#import "PrefView.h"

// URL의 배열을 저장하는 사용자 디폴트 키 
NSString *RSSReaderURLStringArray = @"RSSReaderURLStringArray";

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *viewController1 = [[RSSListView alloc] initWithNibName:@"RSSListView" bundle:nil];
    UIViewController *viewController2 = [[PrefView alloc] initWithNibName:@"PrefView" bundle:nil];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, viewController2, nil];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
