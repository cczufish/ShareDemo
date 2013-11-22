//
//  AppDelegate.m
//  ShareDemo
//
//  Created by YuShuHui on 13-8-27.
//  Copyright (c) 2013年 kanon. All rights reserved.
//



#import "AppDelegate.h"
#import "SinaWeiboViewController.h"
#import "SinaWeibo.h"
#import "ViewController.h"
#import "ShareManager.h"

@implementation AppDelegate

@synthesize viewController = _viewController;
@synthesize sinaweibo;



- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    [[ShareManager sharedManager] connectWeChatWithAppId:kWeiChatAppId];
    [[ShareManager sharedManager] connectQQWithQConnectAppKey:kQQConnectAppKey];
    
    self.sinaController = [[[SinaWeiboViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    sinaweibo = [[SinaWeibo alloc] initWithAppKey:kAppKey appSecret:kAppSecret appRedirectURI:kAppRedirectURI andDelegate:_sinaController];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *sinaweiboInfo = [defaults objectForKey:@"SinaWeiboAuthData"];
    if ([sinaweiboInfo objectForKey:@"AccessTokenKey"] && [sinaweiboInfo objectForKey:@"ExpirationDateKey"] && [sinaweiboInfo objectForKey:@"UserIDKey"])
    {
        sinaweibo.accessToken = [sinaweiboInfo objectForKey:@"AccessTokenKey"];
        sinaweibo.expirationDate = [sinaweiboInfo objectForKey:@"ExpirationDateKey"];
        sinaweibo.userID = [sinaweiboInfo objectForKey:@"UserIDKey"];
    }
    
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

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    if ([[url scheme] isEqualToString:@"wx1eabbfbd666a18a9"])
    {
        return  [WXApi handleOpenURL:url delegate:self];
    }else if([[url scheme] isEqualToString:@"QQ05FDE9A9"]){
        return [TencentOAuth HandleOpenURL:url];
    }else
    {
        return [self.sinaweibo handleOpenURL:url];
    }
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([[url scheme] isEqualToString:@"wx1eabbfbd666a18a9"])
    {
        return  [WXApi handleOpenURL:url delegate:self];
    }else if([[url scheme] isEqualToString:@"QQ05FDE9A9"]){
        return [TencentOAuth HandleOpenURL:url];
    }else
    {
        return [self.sinaweibo handleOpenURL:url];
    }
}

@end