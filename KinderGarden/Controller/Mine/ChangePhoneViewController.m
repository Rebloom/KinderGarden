//
//  ChangePhoneViewController.m
//  KinderGarden
//
//  Created by 孤星之殇 on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "ChangePhoneViewController.h"

@interface ChangePhoneViewController ()

@end

@implementation ChangePhoneViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [checkTimer invalidate];
    
    [getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [getCodeBtn setTitleColor:KPurpleColor forState:UIControlStateNormal];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [checkTimer invalidate];
}

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

    [headerView loadComponentsWithTitle:@"更换手机号" withTitleColor:KBlackColor];
    [headerView setBackgroundColor:KFontColorA];
    [headerView backButton];
    
    [self createCommitBtn];
    [self createUI];

    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [self.view addGestureRecognizer:tap];
}

- (void)createUI
{
    UILabel * tipLabel = [[UILabel alloc] init];
    tipLabel.textColor = KFontColorC;
    tipLabel.font = NormalFontWithSize(14);
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.text = @"更换手机号后，下次登录要用新手机号登录";
    tipLabel.frame = CGRectMake(0, 64, screenWidth, 20);
    [self.view addSubview:tipLabel];
    
    if (!phoneTF)
    {
        phoneTF = [[UITextField alloc] init];
    }
    phoneTF.backgroundColor = [UIColor clearColor];
    phoneTF.frame = CGRectMake(10, 100, screenWidth-100, 41);
    phoneTF.font = NormalFontWithSize(14);
    UIColor *color = KFontColorB;
    phoneTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSForegroundColorAttributeName: color}];
    phoneTF.textColor = KBlackColor;
    phoneTF.delegate = self;
    [self.view addSubview:phoneTF];
    
    if (!codeTF)
    {
        codeTF = [[UITextField alloc] init];
    }
    codeTF.backgroundColor = [UIColor clearColor];
    codeTF.frame = CGRectMake(10, 147, screenWidth-100, 41);
    codeTF.font = NormalFontWithSize(14);
    codeTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输短信验证码" attributes:@{NSForegroundColorAttributeName: color}];
    codeTF.textColor = KBlackColor;
    codeTF.delegate = self;
    [self.view addSubview:codeTF];
    
    //验证码按钮
    if (!getCodeBtn)
    {
        getCodeBtn = [[UIButton alloc] init];
    }
    getCodeBtn.frame = CGRectMake(screenWidth-90, 145+7.5, 80, 30);
    getCodeBtn.tintColor = KFontColorA;
    getCodeBtn.layer.cornerRadius = 15;
    getCodeBtn.layer.borderColor = KPurpleColor.CGColor;
    getCodeBtn.layer.borderWidth = 0.4;
    getCodeBtn.layer.masksToBounds = YES;
    getCodeBtn.titleLabel.font = NormalFontWithSize(13);
    [getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [getCodeBtn setTitleColor:KPurpleColor forState:UIControlStateNormal];
    [getCodeBtn setBackgroundImage:[KFontColorA image] forState:UIControlStateNormal];
    [getCodeBtn addTarget:self action:@selector(codeBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getCodeBtn];
    
    for (int i = 0; i<2; i++)
    {
        UILabel * lineLabel = [[UILabel alloc] init];
        lineLabel.backgroundColor = [UIColor lightGrayColor];
        if (i == 0)
        {
            lineLabel.frame = CGRectMake(10, 145, screenWidth - 10, 0.5);
        }
        else
        {
            lineLabel.frame = CGRectMake(0, 190, screenWidth, 0.5);
        }
        [self.view addSubview:lineLabel];
    }
}

//提交
- (void)commitBtnOnClick:(UIButton*)sender
{
    NSLog(@"提交");
}

//获取验证码
- (void)codeBtnOnClick:(UIButton*)sender
{
    [self Countdown];
}

// 倒计时
- (void)Countdown
{
    [getCodeBtn setTitle:@"剩余60秒" forState:UIControlStateNormal];
    
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
        
        NSDate * nowDate = [NSDate date];
        NSTimeInterval now = [nowDate timeIntervalSinceDate:date];
        
        time = 60-now;
    }
}

// 点击页面，输入框失去焦点
- (void)viewTapped:(UITapGestureRecognizer*)ges
{
    if([phoneTF isFirstResponder])
    {
        [phoneTF resignFirstResponder];
    }
    else if([codeTF isFirstResponder])
    {
        [codeTF resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
