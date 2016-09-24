//
//  RegistViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()

@end

@implementation RegistViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [checkTimer invalidate];
    
    [getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [getCodeBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KFontColorA;

    [headerView loadComponentsWithTitle:@"注册"  withTitleColor:@"#f1f1f1".color];
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
    
    for (int i = 0; i < 3; i++)
    {
        UIImageView * tfImageView = [[UIImageView alloc] init];
        tfImageView.backgroundColor = [UIColor blackColor];
        tfImageView.frame = CGRectMake(53, 100+57*i, screenWidth-106, 45);
        if (i == 2)
        {
            tfImageView.frame = CGRectMake(53, 100+57*i, screenWidth-106-125, 45);
        }
        else
        {
            tfImageView.frame = CGRectMake(53, 100+57*i, screenWidth-106, 45);
        }
        [self.view addSubview:tfImageView];
        
        UIImageView * iconView = [[UIImageView alloc] init];
        if (i == 0)
        {
            iconView.image = [UIImage imageNamed:@"user"];
            iconView.frame = CGRectMake(17, 10, 22, 24);
        }
        else if(i == 1)
        {
            iconView.image = [UIImage imageNamed:@"pwd"];
            iconView.frame = CGRectMake(17, 10, 20, 24);
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
    
    //密码输入框
    if (!pwdTf)
    {
        pwdTf = [[UITextField alloc] init];
    }
    pwdTf.backgroundColor = [UIColor clearColor];
    pwdTf.font = NormalFontWithSize(14);
    pwdTf.frame = CGRectMake(105, 159, screenWidth-53-85, 41);
    pwdTf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:@{NSForegroundColorAttributeName: color}];
    pwdTf.textColor = KFontColorA;
    pwdTf.secureTextEntry = YES;
    pwdTf.delegate = self;
    [self.view addSubview:pwdTf];
    
    //验证码输入框
    if (!codeTf)
    {
        codeTf = [[UITextField alloc] init];
    }
    codeTf.backgroundColor = [UIColor clearColor];
    codeTf.font = NormalFontWithSize(14);
    codeTf.frame = CGRectMake(75, 216, screenWidth-106-125, 41);
    codeTf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSForegroundColorAttributeName: color}];
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
    UIButton * registBtn = [[UIButton alloc] init];
    registBtn.frame = CGRectMake(71, CGRectGetMaxY(codeTf.frame)+30, screenWidth-142, 40);
    registBtn.backgroundColor = KPurpleColor;
    registBtn.layer.cornerRadius = 20;
    registBtn.layer.masksToBounds = YES;
    registBtn.tintColor = KFontColorA;
    registBtn.titleLabel.font = NormalFontWithSize(15);
    [registBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(registBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBtn];
    
    UILabel * orLabel = [[UILabel alloc] init];
    orLabel.text = @"———— or ————";
    orLabel.frame = CGRectMake(0, CGRectGetMaxY(registBtn.frame)+60, screenWidth, 24);
    orLabel.font = NormalFontWithSize(13);
    orLabel.textAlignment = NSTextAlignmentCenter;
    orLabel.textColor = KFontColorA;
    [self.view addSubview:orLabel];
    
    //QQ登录按钮
    UIButton * QQbtn = [[UIButton alloc] init];
    QQbtn.frame = CGRectMake((screenWidth-150-45)/2, CGRectGetMaxY(orLabel.frame)+21, 50, 50);
    QQbtn.layer.cornerRadius = 25;
    QQbtn.layer.borderColor = KFontColorA.CGColor;
    QQbtn.layer.borderWidth = 1;
    QQbtn.layer.masksToBounds = YES;
    [QQbtn addTarget:self action:@selector(QQBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:QQbtn];
    
    UIImageView * QQview = [[UIImageView alloc] init];
    QQview.image = [UIImage imageNamed:@"QQ"];
    QQview.frame = CGRectMake(12.5, 12.5, 25, 25);
    [QQbtn addSubview:QQview];
    
    //微博登录按钮
    UIButton * Sinabtn = [[UIButton alloc] init];
    Sinabtn.frame = CGRectMake(CGRectGetMaxX(QQbtn.frame)+22.5, CGRectGetMaxY(orLabel.frame)+21, CGRectGetWidth(QQbtn.frame), CGRectGetHeight(QQbtn.frame));
    Sinabtn.layer.cornerRadius = 25;
    Sinabtn.layer.borderColor = KFontColorA.CGColor;
    Sinabtn.layer.borderWidth = 1;
    Sinabtn.layer.masksToBounds = YES;
    [Sinabtn addTarget:self action:@selector(SinaBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Sinabtn];
    
    UIImageView * Sinaview = [[UIImageView alloc] init];
    Sinaview.image = [UIImage imageNamed:@"Sina"];
    Sinaview.frame = CGRectMake(12.5, 12.5, 25, 25);
    [Sinabtn addSubview:Sinaview];
    
    //微信登录按钮
    UIButton * WXbtn = [[UIButton alloc] init];
    WXbtn.frame = CGRectMake(CGRectGetMaxX(Sinabtn.frame)+22.5, CGRectGetMaxY(orLabel.frame)+21, CGRectGetWidth(QQbtn.frame), CGRectGetHeight(QQbtn.frame));
    WXbtn.layer.cornerRadius = 25;
    WXbtn.layer.borderColor = KFontColorA.CGColor;
    WXbtn.layer.borderWidth = 1;
    WXbtn.layer.masksToBounds = YES;
    [WXbtn addTarget:self action:@selector(WXBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:WXbtn];
    
    UIImageView * WXview = [[UIImageView alloc] init];
    WXview.image = [UIImage imageNamed:@"WX"];
    WXview.frame = CGRectMake(12.5, 12.5, 25, 25);
    [WXbtn addSubview:WXview];

}

- (void)registBtnOnClick:(UIButton*)sender
{
    if (userNameTf.text.length == 0)
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"请填写手机号"];
        return;
    }
    if (pwdTf.text.length == 0)
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"请填写密码"];
        return;
    }
    if (codeTf.text.length == 0)
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"请填写验证码"];
        return;
    }
    
    [LoginRequest registerWithUserName:userNameTf.text password:pwdTf.text code:codeTf.text delegate:self];
    
}

//获取验证码
- (void)codeBtnOnClick:(UIButton*)sender
{
    [LoginRequest getRegisterCheckCodeWithPhoneNumber:userNameTf.text delegate:self];
    [self countDown];
}

- (void)nxRequestFinished:(NXBaseRequest *)request
{
    if ([request.vrCodeString isEqualToString:kTagRegisterGetCodeRequest])
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"发送成功"];
    }
    else if ([request.vrCodeString isEqualToString:kTagRegisterRequest])
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"注册成功"];
        [self back];
    }
}

// 倒计时
- (void)countDown
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


//QQ登录
- (void)QQBtnOnClick:(UIButton*)sender
{
    NSLog(@"QQ登录");
}

//微博登录
- (void)SinaBtnOnClick:(UIButton*)sender
{
    NSLog(@"微博登录");
}

//微信登录
- (void)WXBtnOnClick:(UIButton*)sender
{
    NSLog(@"微信登录");
}

// 点击页面，输入框失去焦点
- (void)viewTapped:(UITapGestureRecognizer*)ges
{
    if([userNameTf isFirstResponder])
    {
        [userNameTf resignFirstResponder];
    }
    else if([pwdTf isFirstResponder])
    {
        [pwdTf resignFirstResponder];
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
