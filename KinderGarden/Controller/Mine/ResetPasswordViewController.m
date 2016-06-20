//
//  ResetPasswordViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "ResetPasswordViewController.h"

@interface ResetPasswordViewController ()

@end

@implementation ResetPasswordViewController


- (void)createCommitBtn
{
    UIButton * commitBtn = [[UIButton alloc] init];
    commitBtn.titleLabel.font = NormalFontWithSize(14);
    commitBtn.frame = CGRectMake(screenWidth-60, 20, 50, 44);
    [commitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [commitBtn setTitleColor:KFontColorC forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(commitBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:commitBtn];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KFontColorA;

    [headerView loadComponentsWithTitle:@"修改密码" withTitleColor:KBlackColor];
    [headerView setBackgroundColor:KFontColorA];
    [headerView backButton];
    
    [self createCommitBtn];
    [self createUI];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [self.view addGestureRecognizer:tap];
}

- (void)createUI
{
    if (!oldTf)
    {
        oldTf = [[UITextField alloc] init];
    }
    oldTf.backgroundColor = [UIColor clearColor];
    oldTf.frame = CGRectMake(10, 115-43, screenWidth-100, 41);
    oldTf.font = NormalFontWithSize(14);
    UIColor *color = KFontColorB;
    oldTf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"当前密码" attributes:@{NSForegroundColorAttributeName: color}];
    oldTf.textColor = KBlackColor;
    oldTf.delegate = self;
    [self.view addSubview:oldTf];
    
    if (!newTf)
    {
        newTf = [[UITextField alloc] init];
    }
    newTf.backgroundColor = [UIColor clearColor];
    newTf.frame = CGRectMake(10, 160 - 43, screenWidth-100, 41);
    newTf.font = NormalFontWithSize(14);
    newTf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"新密码" attributes:@{NSForegroundColorAttributeName: color}];
    newTf.textColor = KBlackColor;
    newTf.delegate = self;
    [self.view addSubview:newTf];
    
    if (!confirmTf)
    {
        confirmTf = [[UITextField alloc] init];
    }
    confirmTf.backgroundColor = [UIColor clearColor];
    confirmTf.frame = CGRectMake(10, 205-43, screenWidth-100, 41);
    confirmTf.font = NormalFontWithSize(14);
    confirmTf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"再次输入新密码" attributes:@{NSForegroundColorAttributeName: color}];
    confirmTf.textColor = KBlackColor;
    confirmTf.delegate = self;
    [self.view addSubview:confirmTf];

    for (int i = 0; i<3; i++)
    {
        UILabel * lineLabel = [[UILabel alloc] init];
        lineLabel.backgroundColor = [UIColor lightGrayColor];
        if (i == 0)
        {
            lineLabel.frame = CGRectMake(10, 115, screenWidth - 10, 0.5);
        }
        else if (i == 1)
        {
            lineLabel.frame = CGRectMake(10, 160, screenWidth - 10, 0.5);
        }
        else
        {
            lineLabel.frame = CGRectMake(0, 205, screenWidth, 0.5);
        }
        [self.view addSubview:lineLabel];
    }
}

//提交
- (void)commitBtnOnClick:(UIButton*)sender
{
    NSLog(@"提交");
}

// 点击页面，输入框失去焦点
- (void)viewTapped:(UITapGestureRecognizer*)ges
{
    if([oldTf isFirstResponder])
    {
        [oldTf resignFirstResponder];
    }
    else if([newTf isFirstResponder])
    {
        [newTf resignFirstResponder];
    }
    else if([confirmTf isFirstResponder])
    {
        [confirmTf resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
