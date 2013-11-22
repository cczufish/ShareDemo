//
//  ViewController.m
//  ShareDemo
//
//  Created by YuShuHui on 13-8-27.
//  Copyright (c) 2013年 kanon. All rights reserved.
//



#import "ViewController.h"
#import "ShareManager.h"
#import "WXApi.h"
#import "WXApiObject.h"
#import "SinaWeiboViewController.h"
#import "OGActionChooser.h"



@interface ViewController ()<OGActionChooserDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Test Button
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[btn setTitle: @"集成分享" forState:UIControlStateNormal];
	[btn setFrame: CGRectMake(59, 354, 200, 50)];
	[btn addTarget:self action:@selector(showActionSheet:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btn];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)shareToWX:(id)sender {
    [[ShareManager sharedManager] sendTextContentToWX:@"即使缤纷落尽，繁华消亡，也不要被生活磨平了棱角"
                                                scene:WXSceneTypeSession
                                      completionBlock:^(ShareManager *manager, ShareContentState resultCode) {
                                          NSLog(@"======成功：分享文本到朋友=======");
                                          
                                      } failedBlock:^(ShareManager *manager, ShareContentState resultCode) {
                                          if (resultCode == ShareContentStateUnInstalled) {
                                              NSLog(@"======您的尚未安装微信客户端=======");

                                          }else{
                                              NSLog(@"======失败：分享图片到朋友=======");
                                          }
                                      }];

}

- (IBAction)shareToWX1:(id)sender {
    [[ShareManager sharedManager] sendTextContentToWX:@"即使缤纷落尽，繁华消亡，也不要被生活磨平了棱角"
                                                scene:WXSceneTypeTimeline
                                      completionBlock:^(ShareManager *manager, ShareContentState resultCode) {
                                          NSLog(@"======成功：分享文本到朋友圈=======");
                                          
                                          
                                      } failedBlock:^(ShareManager *manager, ShareContentState resultCode) {
                                          if (resultCode == ShareContentStateUnInstalled) {
                                              NSLog(@"======您的尚未安装微信客户端=======");

                                          }else{
                                              NSLog(@"======失败：分享文本到朋友圈=======");
                                          }
                                          
                                          
                                      }];

    
}

- (IBAction)shareToX2:(id)sender {
    [[ShareManager sharedManager] sendImageContentToWX:[UIImage imageNamed:@"1.jpg"]
                                                 scene:WXSceneTypeSession
                                       completionBlock:^(ShareManager *manager, ShareContentState resultCode) {
                                           NSLog(@"======成功：分享图片到朋友=======");
                                           
                                           
                                       } failedBlock:^(ShareManager *manager, ShareContentState resultCode) {
                                           
                                           if (resultCode == ShareContentStateUnInstalled) {
                                               NSLog(@"======您的尚未安装微信客户端=======");
                                               
                                           }else{
                                               NSLog(@"======失败：分享图片到朋友=======");
                                           }
                                           
                                       }];
}

- (IBAction)shareToWX3:(id)sender {
    [[ShareManager sharedManager] sendImageContentToWX:[UIImage imageNamed:@"1.jpg"]
                                                 scene:WXSceneTypeTimeline
                                       completionBlock:^(ShareManager *manager, ShareContentState resultCode) {
                                           NSLog(@"======成功：分享图片到朋友圈=======");
                                           
                                           
                                       } failedBlock:^(ShareManager *manager, ShareContentState resultCode) {
                                           if (resultCode == ShareContentStateUnInstalled) {
                                               NSLog(@"======您的尚未安装微信客户端=======");
                                               
                                           }else{
                                               NSLog(@"======失败：分享图片到朋友圈=======");
                                           }
                                           
                                       }];

}



- (IBAction)shareToQQ:(id)sender {
    [[ShareManager sharedManager] sendTextContentToQQ:@"即使缤纷落尽，繁华消亡，也不要被生活磨平了棱角"
                                      completionBlock:^(ShareManager *manager, ShareContentState resultCode) {
                                          NSLog(@"======成功：分享文本到QQ好友=======");

                                      } failedBlock:^(ShareManager *manager, ShareContentState resultCode) {
                                          if (resultCode == ShareContentStateUnInstalled) {
                                              NSLog(@"======您尚未安装手机QQ客户端=======");

                                          }else{
                                              NSLog(@"======失败：分享文本到QQ好友=======");

                                          }

                                      }];

}

- (IBAction)shareToQQ1:(id)sender {
    [[ShareManager sharedManager] sendImageContentToQQ:[UIImage imageNamed:@"1.jpg"]
                                                 title:@"清晨"
                                           description:@"早上的浦口"
                                       completionBlock:^(ShareManager *manager, ShareContentState resultCode) {
                                           NSLog(@"======成功：分享图片到QQ好友=======");

                                       } failedBlock:^(ShareManager *manager, ShareContentState resultCode) {
                                           if (resultCode == ShareContentStateUnInstalled) {
                                               NSLog(@"======您尚未安装手机QQ客户端=======");
                                               
                                           }else{
                                               NSLog(@"======失败：分享图片到QQ好友=======");
                                               
                                           }
                                       }];

}


- (IBAction)shareToSina:(id)sender{
    SinaWeiboViewController *sinaWeiboViewController = [[[SinaWeiboViewController alloc] init] autorelease];
    
    [self presentModalViewController:sinaWeiboViewController animated:YES];
}


//  ---------------------------------------------------------------
// |
// |  start OGActionChooser configuration
// |
//  ---------------------------------------------------------------

- (void)showActionSheet:(UIButton*)sender
{
	OGActionChooser *acSheet = [OGActionChooser actionChooserWithDelegate:self];
	acSheet.title = @"分享";
	
	OGActionButton *fst = [OGActionButton buttonWithTitle:nil
												imageName:@"sns_icon_1"
												  enabled:YES];
	OGActionButton *snd = [OGActionButton buttonWithTitle:nil
												imageName:@"sns_icon_24"
												  enabled:YES];
	OGActionButton *trd = [OGActionButton buttonWithTitle:nil
												imageName:@"sns_icon_23"
												  enabled:YES];
	
	acSheet.backgroundColor = [UIColor colorWithRed:rand()%255/255.0
                                         green:rand()%255/255.0
                                          blue:rand()%255/255.0 alpha:0.8f];
	
	[acSheet setButtonsWithArray:[NSArray arrayWithObjects:
								  fst, snd,trd, nil]]; // next page
	[acSheet presentInView: sender.superview];
}

//  ---------------------------------------------------------------
// |
// |  Event handling OGActionChooser
// |
//  ---------------------------------------------------------------

- (void)actionChooser:(OGActionChooser *)ac buttonPressedWithIndex:(NSInteger)index
{
	// you can create an array of buttons to identify them by index
	switch (index) {
		case 2000:
            [self shareToSina];
            
			 break;
		case 2001:
			[self shareToQQ];
			break;
		case 2002:
			[self shareToWeixin];
            
            break;
		default:
			NSLog(@"clicked button with index: %i", index);
	}
	
	//[ac dismiss]; // if you like to close it right afterwards
}

- (void)actionChooserFinished:(OGActionChooser *)ac
{
	NSLog(@"cancel button clicked or dismissed programatically");
}

- (void)shareToQQ{
    [[ShareManager sharedManager] sendImageContentToQQ:[UIImage imageNamed:@"1.jpg"]
                                                 title:@"清晨"
                                           description:@"早上的浦口"
                                       completionBlock:^(ShareManager *manager, ShareContentState resultCode) {
                                           NSLog(@"======成功：分享图片到QQ好友=======");
                                           
                                       } failedBlock:^(ShareManager *manager, ShareContentState resultCode) {
                                           if (resultCode == ShareContentStateUnInstalled) {
                                               NSLog(@"======您尚未安装手机QQ客户端=======");
                                               
                                           }else{
                                               NSLog(@"======失败：分享图片到QQ好友=======");
                                               
                                           }
                                       }];
}
- (void)shareToSina{
    SinaWeiboViewController *sinaWeiboViewController = [[[SinaWeiboViewController alloc] init] autorelease];
    
    [self presentModalViewController:sinaWeiboViewController animated:YES];
}
- (void)shareToWeixin{
    [[ShareManager sharedManager] sendImageContentToWX:[UIImage imageNamed:@"1.jpg"]
                                                 scene:WXSceneTypeTimeline
                                       completionBlock:^(ShareManager *manager, ShareContentState resultCode) {
                                           NSLog(@"======成功：分享图片到朋友圈=======");
                                           
                                           
                                       } failedBlock:^(ShareManager *manager, ShareContentState resultCode) {
                                           if (resultCode == ShareContentStateUnInstalled) {
                                               NSLog(@"======您的尚未安装微信客户端=======");
                                               
                                           }else{
                                               NSLog(@"======失败：分享图片到朋友圈=======");
                                           }
                                           
                                       }];
}
@end
