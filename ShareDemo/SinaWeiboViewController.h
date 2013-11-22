//  ShareDemo
//
//  Created by YuShuHui on 13-8-27.
//  Copyright (c) 2013年 kanon. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SinaWeibo.h"
#import "SinaWeiboRequest.h"

@interface SinaWeiboViewController : UIViewController<SinaWeiboDelegate, SinaWeiboRequestDelegate>
{
    UIButton *loginButton;
    UIButton *logoutButton;
    UIButton *postStatusButton;
    UIButton *postImageStatusButton;
    
    NSDictionary *userInfo;
    NSArray *statuses;
    NSString *postStatusText;
    NSString *postImageStatusText;
}

@end
