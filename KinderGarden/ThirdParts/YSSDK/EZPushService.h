//
//  EZPushService.h
//  EzvizOpenSDK
//
//  Created by DeJohn Dong on 15/12/22.
//  Copyright © 2015年 Hikvision. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, EZPushChannel) {
    EZPushChannelAPNS = 0,   //来自APNS
    EZPushChannelInner,      //来自TCP
    EZPushChannelUnknown,
};

@class EZStartPushParameter;

@protocol EZPushSeviceDelegate;

@interface EZPushService : NSObject

@property (nonatomic, weak) id<EZPushSeviceDelegate> delegate;

/**
 *  推送服务单例类
 *
 *  @return 推送服务单例对象
 */
+ (instancetype)sharedService;

/**
 *  设置APNS token
 *
 *  @param apnsToken APNS token
 */
- (void)setAPNSToken:(NSString *)apnsToken pushSecret:(NSString *)secret;

/**
 *  开启推送服务
 *
 *  @param params     开启推送
 *  @param completion 回调block
 */
- (void)startPushService:(EZStartPushParameter *)params completion:(void (^)(NSError *error))completion;

/**
 *  关闭推送服务
 *
 *  @param completion 回调block
 */
- (void)stopPushService:(void (^)(NSError *error))completion;

/**
 *  处理APNS推送信息，把APNS推送过来的消息也交给SDK处理
 *
 *  @param userInfo userInfo description
 */
- (void)handlePushNotificaion:(NSDictionary *)userInfo;

@end

@protocol EZPushSeviceDelegate <NSObject>

/**
 *  推送delegate方法，实现消息统一接收。
 *
 *  @param messageObject 推送对象
 *  @param userInfo      通常情况下APNS推送原始数据，
 *  @param channel       推送类型，用来判断推送是来自萤石推送还是APNS
 */
- (void)messageReceived:(id)messageObject userInfo:(NSDictionary *)userInfo channel:(EZPushChannel)channel;

@end
