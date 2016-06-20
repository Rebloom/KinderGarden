//
//  AccoutSafeViewController.m
//  KinderGarden
//
//  Created by 孤星之殇 on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "AccoutSafeViewController.h"
#import "FifthCell.h"
#import "ChangePhoneViewController.h"
#import "ResetPasswordViewController.h"

@interface AccoutSafeViewController ()

@end

@implementation AccoutSafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KFontColorA;

    [headerView loadComponentsWithTitle:@"账户安全" withTitleColor:KBlackColor];
    [headerView setBackgroundColor:KFontColorA];
    [headerView backButton];
    
    [self createTableView];
}
- (void)createTableView
{
    infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight) style:UITableViewStylePlain];
    infoTableView.delegate = self;
    infoTableView.dataSource = self;
    infoTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:infoTableView];
    
    UIView * footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 0.5)];
    footView.backgroundColor = KFontColorE;
    infoTableView.tableFooterView = footView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    
    FifthCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[FifthCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSArray * titleArr = @[@"手机号",@"修改密码"];
    NSArray * rightArr = @[@"15151234509",@""];

    cell.nameLabel.text = [titleArr objectAtIndex:indexPath.row];
    
    cell.rightLabel.frame = CGRectMake(screenWidth-180, 0, 150, 45);
    cell.rightLabel.text = [rightArr objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [infoTableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0)
    {
        ChangePhoneViewController * CPVC = [[ChangePhoneViewController alloc] init];
        [self pushToViewController:CPVC];
    }
    else if (indexPath.row == 1)
    {
        ResetPasswordViewController * RPVC = [[ResetPasswordViewController alloc] init];
        [self pushToViewController:RPVC];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
