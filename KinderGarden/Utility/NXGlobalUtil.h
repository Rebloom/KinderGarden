//
//  NXGlobalUtil.h
//  OAConnectStore
//
//  Created by haonanchen on 16/4/29.
//  Copyright © 2016年 zengxiangrong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NXMacro.h"
#import "NSString+UIColor.h"
#import "UIImage+UIColor.h"
#import "UILabel+StringFrame.h"
#import "UIView+Snapshot.h"
#import "UIImageView+NXExtend.h"
#import "MBProgressHUD.h"

#import "YYKit.h"
#import "Secret.h"

@interface NXGlobalUtil : NSObject
{
    UILabel * calculateHeightLabel;
}

+ (NXGlobalUtil *)sharedUtil;

- (CGFloat)calculateLabelHeightWithText:(NSString *)text width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing fontSize:(CGFloat)size;

- (CGFloat)calculateLabelHeightWithText:(NSString *)text width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;

- (CGFloat)calculateLabelHeightWithText:(NSString *)text width:(CGFloat)width;

- (CGFloat)calculateLabelHeightWithText:(NSString *)text;

+ (NSDictionary *)dictionaryFromStringValue:(NSString *)string;

+ (NSString *)checkNullData:(NSDictionary *)checkData key:(NSString *)key;

@end
