//
//  EditView.m
//  KinderGarden
//
//  Created by xdcy on 16/8/15.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "EditView.h"
#import "NXMacro.h"
#import "NSString+UIColor.h"
#import "UIImage+UIColor.h"

@implementation EditView
@synthesize isShow;
@synthesize mainView;
@synthesize hideBtn;

- (void)dealloc
{
}

+(EditView*)defaultEditView
{
    static EditView * defaultEditView = nil;
    if (!defaultEditView)
    {
        defaultEditView = [[EditView alloc] init];
    }
    
    return defaultEditView;
}

- (void)showView
{
    isShow = YES;
    mainView.hidden = NO;
}

-(void)hideView
{
    isShow = NO;
    mainView.hidden = YES;
}

- (id)init
{
    [self clearSubview];
    
    if (self = [super init])
    {
        [self createEditView];
    }
    
    return self;
}



- (void)createEditView
{
    if (!mainView)
    {
        mainView = [[UIView alloc] init];
    }
    mainView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    mainView.backgroundColor = [KFontColorC colorWithAlphaComponent:0.3];
    [self addSubview:mainView];
    
    if (!hideBtn)
    {
        hideBtn = [[UIButton alloc] init];
    }
    hideBtn.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    hideBtn.backgroundColor = [UIColor clearColor];
    [hideBtn addTarget:self action:@selector(hideBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:hideBtn];
    
    if (!editView)
    {
        editView = [[UIView alloc] init];
    }
    editView.backgroundColor = KFontColorA;
    editView.layer.cornerRadius = 8;
    editView.clipsToBounds = YES;
    editView.layer.masksToBounds = YES;
    editView.frame = CGRectMake((screenWidth-270)/2, 200, 270, 150);
    [mainView addSubview:editView];
    
    if (!editTF)
    {
        editTF = [[UITextField alloc] init];
    }
    editTF.frame = CGRectMake(20, 30, 230, 45);
    editTF.textColor = KFontColorC;
    editTF.backgroundColor = KFontColorA;
    editTF.layer.borderWidth = 0.7f;
    editTF.layer.borderColor = KFontColorE.CGColor;
    editTF.delegate = self;
    editTF.text = @"";
    editTF.returnKeyType = UIReturnKeyDone;
    [editView addSubview:editTF];
    
    if (!lineTwoLabel)
    {
        lineTwoLabel = [[UILabel alloc] init];
    }
    lineTwoLabel.backgroundColor = KFontColorE;
    lineTwoLabel.frame = CGRectMake(0, CGRectGetMaxY(editTF.frame)+30, CGRectGetWidth(editView.frame), 0.5);
    [editView addSubview:lineTwoLabel];
    
    if (!sureBtn)
    {
        sureBtn = [[UIButton alloc] init];
    }
    sureBtn.titleLabel.font = NormalFontWithSize(15);
    sureBtn.frame = CGRectMake(0, CGRectGetMaxY(lineTwoLabel.frame), CGRectGetWidth(editView.frame), 44);
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:KFontColorC forState:UIControlStateNormal];
    [sureBtn setBackgroundImage:[KFontColorA image] forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sureBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [editView addSubview:sureBtn];
    
    mainView.hidden = YES;
}

- (void)hideBtnOnClick:(UIButton*)sender
{
    mainView.hidden = YES;
    [editTF resignFirstResponder];
}

- (void)sureBtnOnClick:(UIButton*)sender
{
//    if (recordSection == 0)
//    {
//        [classOneArr replaceObjectAtIndex:recordRow withObject:editTF.text];
//    }
//    else
//    {
//        [classTwoArr replaceObjectAtIndex:recordRow withObject:editTF.text];
//    }
//    
//    mainView.hidden = YES;
//    editTF.text = @"";
    
}

// 清除视图块子视图
-(void)clearSubview
{
    if (mainView)
    {
        for (UIView * view in mainView.subviews)
        {
            [view removeFromSuperview];
        }
    }
}
@end
