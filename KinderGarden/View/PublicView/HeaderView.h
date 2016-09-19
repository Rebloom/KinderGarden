//
//  HeaderView.h
//  XDCY
//
//  Created by 孤星之殇 on 15/8/17.
//  Copyright (c) 2015年 孤星之殇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+UIColor.h"
#import "NXMacro.h"
#import "GFStaticData.h"

@protocol HeaderViewDelegate <NSObject>

@optional
- (void)buttonClicked:(id)sender;

@end

@interface HeaderView : UIView

@property (nonatomic, assign) id <HeaderViewDelegate> delegate;
@property (nonatomic, assign) BOOL buttonSelected;

- (void)loadComponentsWithTitle:(NSString *)title;
- (void)loadComponentsWithTitle:(NSString *)title withTitleColor:(UIColor*)titleColor;
- (void)backButton;
- (void)contactBtn;
- (void)publishButton;
- (void)setStatusBarColor:(UIColor *)color;

- (void)addRightBtnWithBtnName:(NSString *)name;

@end
