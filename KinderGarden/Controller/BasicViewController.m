//
//  BasicViewController.m
//  KinderGarden
//
//  Created by 孤星之殇 on 15/8/17.
//  Copyright (c) 2015年 孤星之殇. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController () <UIGestureRecognizerDelegate>

@end

@implementation BasicViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 64)];
    headerView.delegate = self;
    [self.view addSubview:headerView];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    if ([NSStringFromClass([self class]) isEqualToString:@"FirstViewController"] ||
        [NSStringFromClass([self class]) isEqualToString:@"SecondViewController"] ||
        [NSStringFromClass([self class]) isEqualToString:@"ThirdViewController"] ||
        [NSStringFromClass([self class]) isEqualToString:@"FourthViewController"] ||
        [NSStringFromClass([self class]) isEqualToString:@"FifthViewController"] ||
        [NSStringFromClass([self class]) isEqualToString:@"HomeViewController"])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:kTagShowTabbarNoti object:nil];
    }
    else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:kTagHideTabbarNoti object:nil];
    }
   
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;

    // 设置划动返回手势
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
}

- (void)pushToViewController:(BasicViewController *)controller
{
    CATransition *animation = [CATransition animation];
    
    [animation setDuration:0.3];
    
    [animation setType: kCATransitionMoveIn];
    
    [animation setSubtype: kCATransitionFromRight];
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    
    [self.navigationController pushViewController:controller animated:NO];
    
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
}

- (void)presentViewController:(BasicViewController *)controller
{
    CATransition *animation = [CATransition animation];
    
    [animation setDuration:1];
    
    [animation setType: kCATransitionMoveIn];
    
    [animation setSubtype: kCATransitionFromBottom];
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    
    [self presentViewController:controller animated:NO completion:nil];
    
    [self.view.layer addAnimation:animation forKey:nil];
}

- (void)back
{
    if (self.navigationController && self.navigationController.viewControllers.count>1)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)backToRootViewController
{
    if (self.navigationController && self.navigationController.viewControllers.count>1)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)showAlertWithMessage:(NSString *)msg
{
    [[TKAlertCenter defaultCenter] postAlertWithMessage:msg];
}

- (void)buttonClicked:(id)sender
{
    UIButton * btn = (UIButton *)sender;
    if (btn.tag == 1)
    {
        [self back];
    }
    else if (btn.tag == 5)
    {
        [self backToRootViewController];
    }
}

@end
