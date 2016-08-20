//
//  LoginViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"
#import "FindPasswordViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createUI];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [self.view addGestureRecognizer:tap];
}

- (void)createUI
{
    //背景图
    UIImageView * iamgeView = [[UIImageView alloc] init];
    iamgeView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    iamgeView.image = [UIImage imageNamed:@"backImage.jpg"];
    [self.view addSubview:iamgeView];
 
    //底层颜色
    UIImageView * underView = [[UIImageView alloc] init];
    underView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    underView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.80];
    [iamgeView addSubview:underView];

    for (int i = 0; i < 2; i++)
    {
        UIImageView * tfImageView = [[UIImageView alloc] init];
        tfImageView.backgroundColor = [UIColor blackColor];
        tfImageView.frame = CGRectMake(53, 198+57*i, screenWidth-106, 45);
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
    
    //用户名输入框
    if (!userNameTf)
    {
        userNameTf = [[UITextField alloc] init];
    }
    userNameTf.backgroundColor = [UIColor clearColor];
    userNameTf.frame = CGRectMake(107, 200, screenWidth-53-85, 41);
    userNameTf.font = NormalFontWithSize(14);
    UIColor *color = [UIColor whiteColor];
    userNameTf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入账号" attributes:@{NSForegroundColorAttributeName: color}];
    userNameTf.textColor = KFontColorA;
    userNameTf.delegate = self;
    [self.view addSubview:userNameTf];
    
    //密码输入框
    if (!pwdTf)
    {
        pwdTf = [[UITextField alloc] init];
    }
    pwdTf.backgroundColor = [UIColor clearColor];
    pwdTf.font = NormalFontWithSize(14);
    pwdTf.frame = CGRectMake(105, 257, screenWidth-53-85, 41);
    pwdTf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:@{NSForegroundColorAttributeName: color}];
    pwdTf.textColor = KFontColorA;
    pwdTf.secureTextEntry = YES;
    pwdTf.delegate = self;
    [self.view addSubview:pwdTf];
    
    //登陆按钮
    UIButton * loginBtn = [[UIButton alloc] init];
    loginBtn.frame = CGRectMake(71, CGRectGetMaxY(pwdTf.frame)+30, screenWidth-142, 40);
    loginBtn.backgroundColor = KPurpleColor;
    loginBtn.layer.cornerRadius = 20;
    loginBtn.layer.masksToBounds = YES;
    loginBtn.tintColor = KFontColorA;
    loginBtn.titleLabel.font = NormalFontWithSize(15);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    //忘记密码按钮
    UIButton * forgetBtn = [[UIButton alloc] init];
    forgetBtn.frame = CGRectMake(CGRectGetMinX(loginBtn.frame)+20, CGRectGetMaxY(loginBtn.frame)+15,60, 25);
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetBtn.titleLabel.font = NormalFontWithSize(13);
    forgetBtn.titleLabel.textColor = @"#3d8d8d".color;
    [forgetBtn addTarget:self action:@selector(forgetBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetBtn];

    //注册按钮
    UIButton * registBtn = [[UIButton alloc] init];
    registBtn.frame = CGRectMake(screenWidth-153, CGRectGetMaxY(loginBtn.frame)+14, 70, 30);
    registBtn.backgroundColor = @"#353239".color;
    registBtn.layer.cornerRadius = 15;
    registBtn.layer.masksToBounds = YES;
    [registBtn setTitle:@"注册" forState:UIControlStateNormal];
    registBtn.titleLabel.font = NormalFontWithSize(13);
    registBtn.titleLabel.textColor = @"#3fffff".color;
    [registBtn addTarget:self action:@selector(registBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBtn];
    
    UILabel * orLabel = [[UILabel alloc] init];
    orLabel.text = @"———— or ————";
    orLabel.frame = CGRectMake(0, CGRectGetMaxY(registBtn.frame)+40, screenWidth, 24);
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

//登录
- (void)loginBtnOnClick:(UIButton*)sender
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
    
    [LoginRequest loginWithUserName:userNameTf.text password:pwdTf.text delegate:self];
}

- (void)nxRequestFinished:(NXBaseRequest *)request
{
    if ([request.vrCodeString isEqualToString:kTagLoginRequest])
    {
        // 保存用户信息
        NSDictionary * roleDic = [request.attributeDic objectForKey:@"role"];
        [GFStaticData saveObject:[roleDic objectForKey:@"id"] forKey:kTagUserKeyID];
        [GFStaticData saveObject:[roleDic objectForKey:@"phone"] forKey:kTagUserPhone];
        
        HomeViewController * HVC = [[HomeViewController alloc] init];
        [HVC setSelectedTab:TabSelectedFirst];
        [HVC showTabbar];
        [self presentViewController:HVC animated:NO completion:nil];
    }
}

//忘记密码
- (void)forgetBtnOnClick:(UIButton*)sender
{
    FindPasswordViewController * FPVC = [[FindPasswordViewController alloc] init];
    [self pushToViewController:FPVC];
}

//注册
- (void)registBtnOnClick:(UIButton*)sender
{
    RegistViewController * RVC = [[RegistViewController alloc] init];
    [self pushToViewController:RVC];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
