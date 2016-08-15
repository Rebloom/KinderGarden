//
//  HomeViewController.m
//  KinderGarden
//
//  Created by 孤星之殇 on 15/8/17.
//  Copyright (c) 2015年 孤星之殇. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"

#import "MainViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize tabBarController;

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    [AppDelegate instance].HVC = self;
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTabbar) name:kTagShowTabbarNoti object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideTabbar) name:kTagHideTabbarNoti object:nil];
}

- (void)setSelectedTab:(NSInteger)index
{
    MainViewController * first = [[MainViewController alloc] init];
    SecondViewController * second = [[SecondViewController alloc] init];
    ThirdViewController * third = [[ThirdViewController alloc] init];
    FourthViewController * fourth = [[FourthViewController alloc] init];
    FifthViewController * fifth = [[FifthViewController alloc] init];

    UINavigationController * navFirst = [[UINavigationController alloc] initWithRootViewController:first];
    navFirst.navigationBarHidden = YES;
    UINavigationController * navSecond = [[UINavigationController alloc] initWithRootViewController:second];
    navSecond.navigationBarHidden = YES;
    UINavigationController * navThird = [[UINavigationController alloc] initWithRootViewController:third];
    navThird.navigationBarHidden = YES;
    UINavigationController * navFourth = [[UINavigationController alloc] initWithRootViewController:fourth];
    navFourth.navigationBarHidden = YES;
    UINavigationController * navFifth = [[UINavigationController alloc] initWithRootViewController:fifth];
    navFifth.navigationBarHidden = YES;
    
    navFirst.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"主频道" image:[UIImage imageNamed:@"main"] tag:1];
    navSecond.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"动态" image:[UIImage imageNamed:@"dynamic"] tag:2];
    navThird.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"announce"] tag:3];
    navFourth.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[UIImage imageNamed:@"discovery"] tag:4];
    navFifth.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"mine"] tag:5];

    
    
    tabBarController = [[Ivan_UITabBar alloc] init];
        tabBarController.imageArr = [NSArray arrayWithObjects:@"main",@"select_dynamic",@"select_announce",@"select_discovery",@"select_mine",nil];
    
    tabBarController.viewControllers = [NSArray arrayWithObjects:navFirst,navSecond,navThird,navFourth,navFifth,nil];
    [self.view addSubview:tabBarController.view];
    
    if(tabBarController.buttons.count)
    {
        [tabBarController selectedTab:[tabBarController.buttons objectAtIndex:index]];
    }
    else
    {
        [self performSelector:@selector(methodAfter:) withObject:[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%ld",(long)index],@"key",nil] afterDelay:.2];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self showTabbar];
}

- (void)methodAfter:(id)userInfo
{
    NSDictionary * dic = (NSDictionary *)userInfo;
    NSInteger index = [[dic objectForKey:@"key"] integerValue];
    [tabBarController selectedTab:[tabBarController.buttons objectAtIndex:index]];
}

-(void)vcSwitch:(NSNotification*)notifi
{
    [tabBarController selectedTab:[tabBarController.buttons objectAtIndex:[[notifi object] integerValue]]];
}

- (void)showTabbar
{
    if (tabBarController)
    {
        [tabBarController bringCustomTabBarToFront];
    }
}

- (void)hideTabbar
{
    if (tabBarController)
    {
        [tabBarController hideCustomTabBar];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
