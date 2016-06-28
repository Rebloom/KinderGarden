//
//  ArticleDetailViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/6/27.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "ArticleDetailViewController.h"

@interface ArticleDetailViewController ()

@end

@implementation ArticleDetailViewController
@synthesize adHeaderView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [headerView loadComponentsWithTitle:@"详情" withTitleColor:KBlackColor];
    [headerView setStatusBarColor:KFontColorA];
    [headerView backButton];
    
    
    [self createUI];
}

- (void)createUI
{
    infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) style:UITableViewStylePlain];
    infoTableView.delegate = self;
    infoTableView.dataSource = self;
    infoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    infoTableView.backgroundColor = kBackgroundColor;
    [self.view addSubview:infoTableView];
    
    adHeaderView = [[ArticleDetailHeaderView alloc] init];
    adHeaderView.delegate = self;
    adHeaderView.frame = CGRectMake(0, 0, screenWidth, 580);
    
    infoTableView.tableHeaderView = adHeaderView;
}

- (void)attentiontoBtnClick
{
    NSLog(@"关注");
}

- (void)jubaoBtnClick
{
    NSLog(@"我要举报");
}

- (void)backtoBtnClick
{
    [self back];
}

- (void)shareBtnClick
{
    NSLog(@"分享");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * detailID = @"detailID";
    ArticleDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:detailID];
    
    if (!cell)
    {
        cell = [[ArticleDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailID];
    }
    

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 125;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if ([scrollView isEqual:infoTableView])
    {
        if (scrollView.contentOffset.y < 30)
        {
            headerView.alpha = 0;
            [self.view bringSubviewToFront:infoTableView];
            
        }
        else if (scrollView.contentOffset.y > 150)
        {
            headerView.alpha = 1;
            [self.view bringSubviewToFront:headerView];
            [self.view sendSubviewToBack:infoTableView];
        }
        else
        {
            headerView.alpha = (scrollView.contentOffset.y/120);
            [self.view sendSubviewToBack:infoTableView];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
