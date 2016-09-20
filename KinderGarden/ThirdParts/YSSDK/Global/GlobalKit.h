//
//  GlobalKit.h
//  EZOpenSDKDemo
//
//  Created by DeJohn Dong on 15/10/27.
//  Copyright © 2015年 hikvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalKit : NSObject

@property (nonatomic, copy) NSString *accessToken;
@property (nonatomic, copy) NSString *deviceSerialNo;  //设备序列号
@property (nonatomic, copy) NSString *deviceModel;     //设备类型字符串
@property (nonatomic, copy) NSString *deviceVerifyCode; //设备验证码

+ (instancetype)shareKit;

- (void)clearSession;

- (void)clearDeviceInfo;

@end
