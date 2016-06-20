//
//  UILabel+StringFrame.h
//  LingJinMaster
//
//  Created by Rebloom on 15/12/17.
//  Copyright (c) 2015年 Rebloom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (StringFrame)

- (CGSize)boundingRectWithSize:(CGSize)size;

- (CGSize)boundingRectWithSize:(CGSize)size lineSpacingValue:(NSInteger)_spacing;


@end
