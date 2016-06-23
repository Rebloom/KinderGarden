//
//  NSString+UIColor.h
//  UBoxOnline
//
//  Created by ubox on 13-3-21.
//  Copyright (c) 2013年 ubox. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#define KBlackColor     @"#13101b".color
#define KFontColorA     @"#ffffff".color
#define KFontColorB     @"#999999".color //  文字灰
#define KFontColorC     @"#333333".color //  文字黑
#define KFontColorD     @"#666666".color
#define KFontColorE     @"#bbbbbb".color //灰线

#define KPurpleColor    @"#7e7be5".color
#define kBackgroundColor    @"#f1f0ef".color

// 用于扩展NSString,转换UIColor
@interface NSString (UIColor)

// 获取由当前的NSString转换来的UIColor
- (UIColor*)color;

@end
