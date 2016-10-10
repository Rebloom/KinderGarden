//
//  NXMacro.h
//  OAConnectStore
//
//  Created by haonanchen on 16/4/20.
//  Copyright © 2016年 zengxiangrong. All rights reserved.
//

#ifndef NXMacro_h
#define NXMacro_h

#define MY_COLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define screenHeight [UIScreen mainScreen].bounds.size.height
#define screenWidth  [UIScreen mainScreen].bounds.size.width

#define NormalFontWithSize(x)   [UIFont fontWithName:@"Helvetica" size:x]
#define MiddleFontWithSize(x)   [UIFont fontWithName:@"Helvetica" size:x]
#define BoldFontWithSize(x)     [UIFont fontWithName:@"Helvetica-Bold" size:x]

#define LightSTFontWithSize(x) [UIFont fontWithName:@"STHeitiSC-Light" size:x]
#define MediumSTFontWithSize(x)   [UIFont fontWithName:@"STHeitiSC-Medium" size:x]

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

// 判断iPhone
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone4s ([UIScreen instancesRespondToSelector:@selector(currentMode)]? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) :NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)]? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) :NO)
#define iPhone6Plus (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0) 

// 颜色值定义

#define NXDefaultGrayBGColor        MY_COLOR(244,244,244,1)

// 橙色
#define NXOrangeColor               MY_COLOR(252,79,30,1)

// 本地存储键值对
#define kTagSavedKeyUserID      @"kTagSavedKeyUserID"
#define kTagSavedKeyPhone       @"kTagSavedKeyPhone"
#define kTagSavedKeyCheckCode   @"kTagSavedKeyCheckCode"
#define kTagSavedKeyToken       @"kTagSavedKeyToken"
#define kTagSavedKeyUserName    @"kTagSavedKeyUserName"
#define kTagSavedKeyUserheader  @"kTagSavedKeyUserheader"
#define kTagSavedKeyUserAbout   @"kTagSavedKeyUserAbout"

#define kTagSavedKeyImageHost   @"kTagSavedKeyImageHost"

#define kTagSavedKeyUserInfo    @"kTagSavedKeyUserInfo"

// 通知的key
#define kTagGoodsChangedNoti    @"kTagGoodsChangedNoti"

#define kTagShowTabbarNoti              @"kTagShowTabbarNoti"
#define kTagHideTabbarNoti              @"kTagHideTabbarNoti"

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define KNOTIFICATION_LOGINCHANGE @"loginStateChange"

#define CHATVIEWBACKGROUNDCOLOR [UIColor colorWithRed:0.936 green:0.932 blue:0.907 alpha:1]


// 第三方的appid与appkey

// 萤石的key跟secret
#define YSAppKey                @"8ff0d3e7aab5485195fd7ddcb0a33934"

#define YSAppSecret             @"6741c50a996dd8a185a2ceaf06f28be2"


#endif /* NXMacro_h */

