//
//  NXGlobalUtil.m
//  OAConnectStore
//
//  Created by haonanchen on 16/4/29.
//  Copyright © 2016年 zengxiangrong. All rights reserved.
//

#import "NXGlobalUtil.h"

#import "UILabel+StringFrame.h"

@implementation NXGlobalUtil

static NXGlobalUtil * shareUtil = nil;

+ (NXGlobalUtil *)sharedUtil
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareUtil = [[self alloc] init];
    });
    
    return shareUtil;
}

- (id)init
{
    if (self == [super init])
    {
        calculateHeightLabel = [[UILabel alloc] init];
        calculateHeightLabel.font = NormalFontWithSize(15);
    }
    return self;
}

- (CGFloat)calculateLabelHeightWithText:(NSString *)text width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing fontSize:(CGFloat)size
{
    calculateHeightLabel.font = NormalFontWithSize(size);
    calculateHeightLabel.text = text;
    
    CGSize retSize = [calculateHeightLabel boundingRectWithSize:CGSizeMake(width, 0) lineSpacingValue:lineSpacing];
    
    return retSize.height;
}

- (CGFloat)calculateLabelHeightWithText:(NSString *)text width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing
{
    calculateHeightLabel.font = NormalFontWithSize(15);
    calculateHeightLabel.text = text;
    CGSize retSize = [calculateHeightLabel boundingRectWithSize:CGSizeMake(width, 0) lineSpacingValue:lineSpacing];
    
    return retSize.height;
}

- (CGFloat)calculateLabelHeightWithText:(NSString *)text width:(CGFloat)width
{
    return [self calculateLabelHeightWithText:text width:width lineSpacing:0];
}

- (CGFloat)calculateLabelHeightWithText:(NSString *)text
{
    return [self calculateLabelHeightWithText:text width:screenWidth];
}

+ (NSDictionary *)dictionaryFromStringValue:(NSString *)string
{
    if (string.length) {
        NSError * error;
        NSDictionary * jsonDic = [NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&error];
        if (jsonDic && [jsonDic isKindOfClass:[NSDictionary class]]){
            return jsonDic;
        }
    }
    return nil;
}

@end
