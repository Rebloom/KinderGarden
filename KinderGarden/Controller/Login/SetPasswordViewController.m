//
//  SetPasswordViewController.m
//  KinderGarden
//
//  Created by 孤星之殇 on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "SetPasswordViewController.h"

@interface SetPasswordViewController ()

@end

@implementation SetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KFontColorA;

    [headerView loadComponentsWithTitle:@"设置账号密码"  withTitleColor:@"#f1f1f1".color];
    [headerView setBackgroundColor:KBlackColor];
    [headerView backButton];
    
    [self createUI];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [self.view addGestureRecognizer:tap];
}

- (void)createUI
{
    //背景图
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 64, screenWidth, screenHeight-64);
    imageView.image = [UIImage imageNamed:@"backImage.jpg"];
    [self.view addSubview:imageView];
    
    //底层颜色
    UIImageView * underView = [[UIImageView alloc] init];
    underView.frame = CGRectMake(0, 0, screenWidth, CGRectGetHeight(imageView.frame));
    underView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.80];
    [imageView addSubview:underView];
    
    for (int i = 0; i < 2; i++)
    {
        UIImageView * tfImageView = [[UIImageView alloc] init];
        tfImageView.backgroundColor = [UIColor blackColor];
        tfImageView.frame = CGRectMake(53, 100+57*i, screenWidth-106, 45);
        [self.view addSubview:tfImageView];
        
        UIImageView * iconView = [[UIImageView alloc] init];
        if (i == 0)
        {
            iconView.image = [UIImage imageNamed:@"user"];
            iconView.frame = CGRectMake(17, 10, 22, 24);
        }
        else
        {
            iconView.image = [UIImage imageNamed:@"pwd"];
            iconView.frame = CGRectMake(17, 10, 20, 24);
        }
        [tfImageView addSubview:iconView];
    }
    
    //密码输入框
    if (!pwdTf)
    {
        pwdTf = [[UITextField alloc] init];
    }
    pwdTf.backgroundColor = [UIColor clearColor];
    pwdTf.font = NormalFontWithSize(14);
    pwdTf.frame = CGRectMake(107, 102, screenWidth-53-85, 41);
    UIColor *color = [UIColor whiteColor];
    pwdTf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"设置新密码" attributes:@{NSForegroundColorAttributeName: color}];
    pwdTf.textColor = KFontColorA;
    pwdTf.secureTextEntry = YES;
    pwdTf.delegate = self;
    [self.view addSubview:pwdTf];
    
    //确认密码
    if (!confirmTf)
    {
        confirmTf = [[UITextField alloc] init];
    }
    confirmTf.backgroundColor = [UIColor clearColor];
    confirmTf.font = NormalFontWithSize(14);
    confirmTf.frame = CGRectMake(105, 159, screenWidth-53-85, 41);
    confirmTf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"重新输入一遍" attributes:@{NSForegroundColorAttributeName: color}];
    confirmTf.textColor = KFontColorA;
    confirmTf.delegate = self;
    confirmTf.keyboardType = UIKeyboardTypeDefault;
    [self.view addSubview:confirmTf];
    
    //下一步按钮
    UIButton * nextBtn = [[UIButton alloc] init];
    nextBtn.frame = CGRectMake(71, CGRectGetMaxY(confirmTf.frame)+30, screenWidth-142, 40);
    nextBtn.backgroundColor = KPurpleColor;
    nextBtn.layer.cornerRadius = 20;
    nextBtn.layer.masksToBounds = YES;
    nextBtn.tintColor = KFontColorA;
    nextBtn.titleLabel.font = NormalFontWithSize(15);
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
}

- (void)nxRequestFinished:(NXBaseRequest *)request
{
    
}

//下一步
- (void)nextBtnOnClick:(UIButton*)sender
{
    NSLog(@"下一步");
}

// 点击页面，输入框失去焦点
- (void)viewTapped:(UITapGestureRecognizer*)ges
{
    if([confirmTf isFirstResponder])
    {
        [confirmTf resignFirstResponder];
    }
    else if([pwdTf isFirstResponder])
    {
        [pwdTf resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
