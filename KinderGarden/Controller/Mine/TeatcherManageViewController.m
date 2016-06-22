//
//  TeatcherManageViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/6/12.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "TeatcherManageViewController.h"
#import "AddTeatcherCell.h"
#import "TeatcherInfoViewController.h"

@interface TeatcherManageViewController ()

@end

@implementation TeatcherManageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KFontColorA;
    
    selectDict = [[NSMutableDictionary alloc] initWithCapacity:10];

    [headerView loadComponentsWithTitle:@"老师管理" withTitleColor:KBlackColor];
    [headerView backButton];
    [headerView setBackgroundColor:KFontColorA];

    [self createUI];
}

- (void)createUI
{
    infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64) style:UITableViewStylePlain];
    infoTableView.delegate = self;
    infoTableView.dataSource = self;
    [self.view addSubview:infoTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.f;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * addCellID = @"addID";
    AddTeatcherCell * cell = [tableView dequeueReusableCellWithIdentifier:addCellID];
    if (cell == nil)
    {
        cell = [[AddTeatcherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addCellID];
    }
    
    
    NSArray * tempArr= @[@"小A",@"豆豆",@"妞妞",@"贝贝娜",@"萌萌",@"妞妞",@"赵子轩",@"豆豆",@"妞妞",@"老师"];
    
    cell.nameLabel.text = [tempArr objectAtIndex:indexPath.row];
    cell.selectImageView.image = [UIImage imageNamed:@"teatcherChat"];
    cell.selectImageView.frame = CGRectMake(screenWidth-20-12, 21, 20, 19);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TeatcherInfoViewController * TIVC = [[TeatcherInfoViewController alloc] init];
    [self pushToViewController:TIVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
