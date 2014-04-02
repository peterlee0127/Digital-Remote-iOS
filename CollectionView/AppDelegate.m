

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window,token;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
        [NUIAppearance init];
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert |
                                                                           UIRemoteNotificationTypeSound | UIRemoteNotificationTypeBadge)];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
  
    
    //[self performSegueWithIdentifier:@"LoginView" sender:self];
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
       [[NSUserDefaults standardUserDefaults] synchronize];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSString * tempToken = [deviceToken description];
    self.token = [tempToken stringByReplacingOccurrencesOfString:@"<" withString:@""];
    self.token = [self.token stringByReplacingOccurrencesOfString:@">" withString:@""];
    self.token = [[self.token componentsSeparatedByString:@" "] componentsJoinedByString:@"" ];
    NSLog(@"got string token %@", self.token);
}

- (void)applicationWillTerminate:(UIApplication *)application
{
       [[NSUserDefaults standardUserDefaults] synchronize];
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err
{
    NSLog(@"Error=[%@]", err);
    // TODO: when user do not allow push notification service, pop the warning message.
}

// This function called when receive notification and app is in the foreground.
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    /* 把收到的推播列舉出來 */
    for (id key in userInfo) {
        NSLog(@"Key=[%@], Value=[%@]", key, [userInfo objectForKey:key]);
    }
    
    /* 印出 Badge number */
    NSLog(@"Badge: %@", [[userInfo objectForKey:@"aps"] objectForKey:@"badge"]);
    
}
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
    [UIApplication sharedApplication].applicationIconBadgeNumber=application.applicationIconBadgeNumber-1;
}
@end
