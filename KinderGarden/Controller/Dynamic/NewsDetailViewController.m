//
//  NewsDetailViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/5/20.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController
@synthesize title;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KFontColorA;
    
    [headerView loadComponentsWithTitle:self.title withTitleColor:KFontColorA];
    [headerView setBackgroundColor:KPurpleColor];
    [headerView backButton];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
