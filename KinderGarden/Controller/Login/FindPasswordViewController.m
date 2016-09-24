//
//  FindPasswordViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "FindPasswordViewController.h"
#import "SetPasswordViewController.h"

#import "LoginRequest.h"

@interface FindPasswordViewController ()

@end

@implementation FindPasswordViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [checkTimer invalidate];
    
    [getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [getCodeBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
    getCodeBtn.userInteractionEnabled = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KFontColorA;

    [headerView loadComponentsWithTitle:@"找回密码"  withTitleColor:@"#f1f1f1".color];
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
        if (i == 0)
        {
            tfImageView.frame = CGRectMake(53, 100+57*i, screenWidth-106, 45);
        }
        else
        {
            tfImageView.frame = CGRectMake(53, 100+57*i, screenWidth-106-125, 45);
        }
        [self.view addSubview:tfImageView];
        
        UIImageView * iconView = [[UIImageView alloc] init];
        if (i == 0)
        {
            iconView.image = [UIImage imageNamed:@"user"];
            iconView.frame = CGRectMake(17, 10, 22, 24);
        }
        else
        {
            iconView.image = [UIImage imageNamed:@""];
            iconView.frame = CGRectZero;
        }
        [tfImageView addSubview:iconView];
    }
    
    //用户名输入框
    if (!userNameTf)
    {
        userNameTf = [[UITextField alloc] init];
    }
    userNameTf.backgroundColor = [UIColor clearColor];
    userNameTf.frame = CGRectMake(107, 102, screenWidth-53-85, 41);
    userNameTf.font = NormalFontWithSize(14);
    UIColor *color = [UIColor whiteColor];
    userNameTf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSForegroundColorAttributeName: color}];
    userNameTf.textColor = KFontColorA;
    userNameTf.delegate = self;
    userNameTf.keyboardType = UIKeyboardTypeDefault;
    [self.view addSubview:userNameTf];
    
    //验证码输入框
    if (!codeTf)
    {
        codeTf = [[UITextField alloc] init];
    }
    codeTf.backgroundColor = [UIColor clearColor];
    codeTf.font = NormalFontWithSize(14);
    codeTf.frame = CGRectMake(75, 159, screenWidth-106-125, 41);
    codeTf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入短信验证码" attributes:@{NSForegroundColorAttributeName: color}];
    codeTf.textColor = KFontColorA;
    codeTf.delegate = self;
    [self.view addSubview:codeTf];
    
    //验证码按钮
    if (!getCodeBtn)
    {
        getCodeBtn = [[UIButton alloc] init];
    }
    getCodeBtn.frame = CGRectMake(CGRectGetMaxX(codeTf.frame)+15, CGRectGetMinY(codeTf.frame), 90, 40);
    getCodeBtn.tintColor = KFontColorA;
    getCodeBtn.layer.cornerRadius = 4;
    getCodeBtn.layer.masksToBounds = YES;
    getCodeBtn.titleLabel.font = NormalFontWithSize(14);
    [getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [getCodeBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
    [getCodeBtn setBackgroundImage:[KPurpleColor image] forState:UIControlStateNormal];
    [getCodeBtn addTarget:self action:@selector(codeBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getCodeBtn];
    
    //登陆按钮
    UIButton * nextBtn = [[UIButton alloc] init];
    nextBtn.frame = CGRectMake(71, CGRectGetMaxY(codeTf.frame)+30, screenWidth-142, 40);
    nextBtn.backgroundColor = KPurpleColor;
    nextBtn.layer.cornerRadius = 20;
    nextBtn.layer.masksToBounds = YES;
    nextBtn.tintColor = KFontColorA;
    nextBtn.titleLabel.font = NormalFontWithSize(15);
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
}

- (void)nextBtnOnClick:(UIButton*)sender
{
    if (userNameTf.text.length == 0)
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"请填写手机号"];
        return;
    }
    if (codeTf.text.length == 0)
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"请填写验证码"];
        return;
    }
    
    [LoginRequest resetPasswordWithPhone:userNameTf.text checkCode:codeTf.text delegate:self];
}

//获取验证码
- (void)codeBtnOnClick:(UIButton*)sender
{
    [self Countdown];
    
    [LoginRequest getRegisterCheckCodeWithPhoneNumber:userNameTf.text delegate:self];
}

- (void)nxRequestFinished:(NXBaseRequest *)request
{
    if ([request.vrCodeString isEqualToString:kTagRegisterGetCodeRequest])
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"验证码已发送"];
    }
    else if ([request.vrCodeString isEqualToString:kTagResetPasswordCheckCode])
    {
        SetPasswordViewController * SPVC = [[SetPasswordViewController alloc] init];
        SPVC.passPhone = userNameTf.text;
        [self pushToViewController:SPVC];
    }
}

// 倒计时
- (void)Countdown
{
    [getCodeBtn setTitle:@"剩余60秒" forState:UIControlStateNormal];
    [getCodeBtn setBackgroundImage:[@"#767676".color image] forState:UIControlStateNormal];
    
    date = [[NSDate alloc] init];
    
    time = 60;
    checkTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(handleTimer)
                                                userInfo:nil
                                                 repeats:YES];
    getCodeBtn.userInteractionEnabled = NO;
}

- (void)handleTimer
{
    if (time == 0)
    {
        [checkTimer pauseTimer];
        getCodeBtn.userInteractionEnabled = YES;
        getCodeBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [getCodeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
        [getCodeBtn setBackgroundImage:[KPurpleColor image] forState:UIControlStateNormal];
    }
    else
    {
        [getCodeBtn setTitle:[NSString stringWithFormat:@"剩余%d秒",(int)time] forState:UIControlStateNormal];
        [getCodeBtn setBackgroundImage:[@"#767676".color image] forState:UIControlStateNormal];
        
        NSDate * nowDate = [NSDate date];
        NSTimeInterval now = [nowDate timeIntervalSinceDate:date];
        
        time = 60-now;
    }
}

// 点击页面，输入框失去焦点
- (void)viewTapped:(UITapGestureRecognizer*)ges
{
    if([userNameTf isFirstResponder])
    {
        [userNameTf resignFirstResponder];
    }
    else if([codeTf isFirstResponder])
    {
        [codeTf resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
