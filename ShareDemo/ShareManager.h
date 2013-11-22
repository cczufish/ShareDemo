//
//  ShareManager.h
//  ShareDemo
//
//  Created by YuShuHui on 13-8-27.
//  Copyright (c) 2013年 kanon. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "WXApi.h"
#import "WXApiObject.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/TencentOAuthObject.h>
#import "TencentOpenAPI/QQApiInterface.h"
#import "SinaWeibo.h"

typedef enum {
    WXSceneTypeSession   = 0,
    WXSceneTypeTimeline  = 1
}WXSceneTypeE;


typedef enum {
    ShareTypeWeiChat    = 0,
    ShareTypeQQ         = 1,
    ShareTypeSinaWeibo        = 2,
}ShareTypeE;

/**
 *	@brief	发布内容状态
 */
typedef enum{
	ShareContentStateBegan = 0,              /**< 开始 */
	ShareContentStateSuccess = 1,            /**< 成功 */
	ShareContentStateFail = 2,               /**< 失败 */
    ShareContentStateUnInstalled = 3,        /**< 未安装 */
	ShareContentStateCancel = 4,             /**< 取消 */
    ShareContentStateNotSupport = 5          /**< 设备不支持 */
}ShareContentState;

typedef enum  {
    MailShareStateCancelled      = 0,
    MailShareStateSaved          = 1,
    MailShareStateSent           = 2,
    MailShareStateFailed         = 3,
}MailShareState;

#define kWeiChatAppId       @"wx1eabbfbd666a18a9"
#define kQQConnectAppKey    @"100526505"
#define kQQConnectAppSecret @"bbf5fff90f5a17fa1b0929deb285b066"

#pragma mark - 新浪微博需要常量

#define kAppKey             @"1306263341"
#define kAppSecret          @"a41c3937dfc60f983acf319fbebee14c"
#define kAppRedirectURI     @"http://jyp.app.91waijiao.com/"

#pragma mark - Document文件夹
#define DOCUMENTS_FOLDER [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]



@class ShareManager;

typedef void (^ShareQQBlock)(ShareManager *manager, ShareContentState resultCode);
typedef void (^ShareWeiChatBlock)(ShareManager *manager, ShareContentState resultCode);
typedef void (^ShareSMSBlock)(ShareManager *manager, ShareContentState resultCode);
typedef void (^ShareMailBlock)(ShareManager *manager, MailShareState state);


@interface ShareManager : NSObject<WXApiDelegate,TencentSessionDelegate>{
	ShareQQBlock       _completionQQBlock;
	ShareQQBlock       _failureQQBlock;
    
    ShareWeiChatBlock  _completionWXBlock;
	ShareWeiChatBlock  _failureWXBlock;

}

@property (nonatomic, retain) TencentOAuth *tencentOAuth;


+ (ShareManager *)sharedManager;

- (void)connectWeChatWithAppId:(NSString *)appId;
- (void)connectQQWithQConnectAppKey:(NSString *)qconnectAppKey;

-(BOOL) handleOpenURL:(NSURL *) url;

//Share via QQ
- (void) sendImageContentToQQ:(UIImage *)image
                        title:(NSString*)title
                  description:(NSString*)description
              completionBlock:(ShareQQBlock)aCompletionQQBlock
                  failedBlock:(ShareQQBlock)aFailedQQBlock;
- (void) sendTextContentToQQ:(NSString *)text
             completionBlock:(ShareQQBlock)aCompletionQQBlock
                 failedBlock:(ShareQQBlock)aFailedQQBlock;

//Share via WeiChat
- (void) sendImageContentToWX:(UIImage *)image
                        scene:(WXSceneTypeE)sceneSession
              completionBlock:(ShareWeiChatBlock)aCompletionWXBlock
                  failedBlock:(ShareWeiChatBlock)aFailedWXBlock;
- (void) sendTextContentToWX:(NSString *)text
                       scene:(WXSceneTypeE)sceneSession
             completionBlock:(ShareWeiChatBlock)aCompletionWXBlock
                 failedBlock:(ShareWeiChatBlock)aFailedWXBlock;


@end
