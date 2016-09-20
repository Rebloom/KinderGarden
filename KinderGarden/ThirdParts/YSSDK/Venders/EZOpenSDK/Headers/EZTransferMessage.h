//
//  EZTransferMessage.h
//  EzvizOpenSDK
//
//  Created by DeJohn Dong on 16/1/5.
//  Copyright © 2016年 Hikvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EZTransferMessage : NSObject

/**
 *  消息Id
 */
@property (nonatomic, copy) NSString *id;
/**
 *  消息类型
 */
@property (nonatomic, copy) NSString *type;
/**
 *  消息数据
 */
@property (nonatomic, copy) NSString *data;
/**
 *  设备序列号
 */
@property (nonatomic, copy) NSString *deviceSerial;
/**
 *  创建时间
 */
@property (nonatomic, strong) NSDate *createTime;

@end
