//
//  AppDelegate.h
//  ShareDemo
//
//  Created by YuShuHui on 13-8-27.
//  Copyright (c) 2013年 kanon. All rights reserved.
//



#import <UIKit/UIKit.h>

@class ViewController;
@class SinaWeibo;
@class SinaWeiboViewController;
#import "WXApi.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,WXApiDelegate>
{
    SinaWeibo                       *sinaweibo;
}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (nonatomic, retain) UINavigationController *navController;
@property (readonly, nonatomic) SinaWeibo *sinaweibo;
@property (strong, nonatomic) SinaWeiboViewController *sinaController;
@end
