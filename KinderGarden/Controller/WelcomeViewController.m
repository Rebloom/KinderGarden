//
//  WelcomeViewController.m
//  KinderGarden
//
//  Created by 孤星之殇 on 15/8/17.
//  Copyright (c) 2015年 孤星之殇. All rights reserved.
//

#import "WelcomeViewController.h"
#import "HomeViewController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (void)viewDidLoad
{ 
    [super viewDidLoad];
    [self showIntroWithSeparatePagesInit];
}

- (void)showIntroWithSeparatePagesInit {
//    EAIntroPage *page1 = [EAIntroPage page];
//    page1.bgImage = [UIImage imageNamed:@"page1"];
//    
//    EAIntroPage *page2 = [EAIntroPage page];
//    page2.bgImage = [UIImage imageNamed:@"page2"];
//    
//    EAIntroPage *page3 = [EAIntroPage page];
//    page3.bgImage = [UIImage imageNamed:@"page3"];
//    
//    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3]];
//    
//    [intro setDelegate:self];
//    [intro showInView:self.view animateDuration:0.0];
}

- (void)introDidFinish
{
    HomeViewController * HVC = [[HomeViewController alloc] init];
    [HVC setSelectedTab:TabSelectedFirst];
    [HVC showTabbar];
    [self presentViewController:HVC animated:NO completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
