//
//  EZCameraInfo.h
//  EzvizOpenSDK
//
//  Created by DeJohn Dong on 15/9/15.
//  Copyright (c) 2015年 Hikvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EZCameraInfo : NSObject

/**
 *  摄像头ID
 */
@property (nonatomic, copy) NSString *cameraId;
/**
 *  摄像头名称
 */
@property (nonatomic, copy) NSString *cameraName;
/**
 *  通道号
 */
@property (nonatomic) NSInteger channelNo;
/**
 *  设备ID，暂时无特别用处
 */
@property (nonatomic, copy) NSString *deviceId;
/**
 *  设备名称
 */
@property (nonatomic, copy) NSString *deviceName;
/**
 *  设备序列号
 */
@property (nonatomic, copy) NSString *deviceSerial;
/**
 *  设备是否加密
 */
@property (nonatomic) BOOL isEncrypt;
/**
 *  分享状态：0、未分享，1、分享所有者，2、分享接受者（表示此摄像头是别人分享给我的）
 */
@property (nonatomic) NSInteger isShared;
/**
 *  设备PC端设备的封面地址
 */
@property (nonatomic, copy) NSString *picUrl;
/**
 *  设备在线状态
 */
@property (nonatomic) BOOL isOnline;
/**
 *  是否开启活动检测
 */
@property (nonatomic) BOOL isDefence;
/**
 *  视频清晰度：0、流畅，1、均衡，2、高清
 */
@property (nonatomic) NSInteger videoLevel;

@end
