//
//  RootViewController.m
//  KinderGarden
//
//  Created by 孤星之殇 on 15/8/17.
//  Copyright (c) 2015年 孤星之殇. All rights reserved.
//

#import "RootViewController.h"
#import "TKAlertCenter.h"
#import "HomeViewController.h"
#import "WelcomeViewController.h"
#import "LoginViewController.h"
#import "NXMacro.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// 判断去哪个页面
- (void)judgeToViewController
{
    if ([GFStaticData getObjectForKey:kTagUserKeyID])
    {
        [self performSelector:@selector(toHomeViewController) withObject:nil afterDelay:.5];
    }
    else
    {
        [self performSelector:@selector(toLoginViewController) withObject:nil afterDelay:.5];
    }
    
//    // well变量是登陆录过的标识
//#warning 欢迎页面
////    NSString * well = [GFStaticData getObjectForKey:kTagUserKeyWelcomed];
//    NSString * token = [GFStaticData getObjectForKey:kTagUserKeyToken];
////    if (well)
////    {
//        if (token)
//        {
//            if (token.length)
//            {
//                [self performSelector:@selector(toHomeViewController) withObject:nil afterDelay:.5];
//            }
//            else
//            {
//                [self performSelector:@selector(toLoginViewController) withObject:nil afterDelay:.5];
//            }
//        }
//        else
//        {
//            [self performSelector:@selector(toLoginViewController) withObject:nil afterDelay:.5];
//        }
////    }
////    else
////    {
////        [self performSelector:@selector(toWelcomeViewController) withObject:nil afterDelay:.5];
////    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString * imageName = @"";
    if ([UIScreen mainScreen].bounds.size.height == 480.0)
    {
        imageName = @"Default";
    }
    else if([UIScreen mainScreen].bounds.size.height == 568.0)
    {
        imageName = @"Default-568h";
    }
    else if ([UIScreen mainScreen].bounds.size.height == 667.0)
    {
        imageName = @"Defualt-667";
    }
    else if ([UIScreen mainScreen].bounds.size.height == 736.0)
    {
        imageName = @"default(1242*2208)";
    }
    
    UIImageView * welcome = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    [self.view addSubview:welcome];
    
    [self addAnimation];
    
    [self judgeToViewController];
}

// 用一个渐隐的动画过渡
- (void)addAnimation
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:1];
    [animation setType: kCATransitionFade];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.view.layer addAnimation:animation forKey:@"CATransition"];
}

//去欢迎页
- (void)toWelcomeViewController
{
    WelcomeViewController * WVC = [[WelcomeViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:WVC];
    nav.navigationBarHidden = YES;
    [self presentViewController:nav animated:YES completion:nil];
}

// 去首页
- (void)toHomeViewController
{    
    HomeViewController * HVC = [[HomeViewController alloc] init];
    [HVC setSelectedTab:TabSelectedFirst];
    [HVC showTabbar];
    [self presentViewController:HVC animated:NO completion:nil];
}

//登陆
- (void)toLoginViewController
{
    LoginViewController * LVC = [[LoginViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:LVC];
    nav.navigationBarHidden = YES;
    [self presentViewController:nav animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
