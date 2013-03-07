//
//  AppDelegate.m
//  XieCheng
//
//  Created by chen on 13-3-2.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "XCAppDelegate.h"
#import "XCRootViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [XCContext InitContext];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
//    [self.window setTransform: CGAffineTransformMakeRotation(M_PI / 2)];
    // Override point for customization after application launch.
//    self.window.backgroundColor = [UIColor blueColor];
    
//    [XCContext GetContext].m_rect = CGRectMake(self.window.frame.origin.y, self.window.frame.origin.x, self.window.frame.size.height, self.window.frame.size.width);
    [XCContext GetContext].m_rect = CGRectMake(0, 0, 567, 320);
    XCRootViewController* xcRootViewController = [[XCRootViewController alloc] initWithFrame:[XCContext GetContext].m_rect];
//    self.window.rootViewController = xcRootViewController;
//    [self.window addSubview:xcRootViewController.view];
    
//    if ( [[UIDevice currentDevice].systemVersion floatValue] < 6.0)
//        
//    { // warning: addSubView doesn't work on iOS6
    
        [self.window addSubview: xcRootViewController.view];
//    }
//    
//    else
//        
//    { // use this mehod on ios6    
//        [self.window setRootViewController:xcRootViewController];
//    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
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

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
//{
//    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
//}

@end
