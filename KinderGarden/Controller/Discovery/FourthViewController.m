//
//  FourthViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "FourthViewController.h"
#import "ParentsChatViewController.h"

#import "AttentionAndFunsViewController.h"
#import "LookViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = kBackgroundColor;
    
    [headerView loadComponentsWithTitle:@"发现" withTitleColor:KFontColorA];
    
    [self createTableView];
}

- (void)createTableView
{
    infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight) style:UITableViewStylePlain];
    infoTableView.backgroundColor = [UIColor clearColor];
    infoTableView.delegate = self;
    infoTableView.dataSource = self;
    infoTableView.scrollEnabled = NO;
    infoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    infoTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:infoTableView];
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 10)];
    view.backgroundColor = kBackgroundColor;
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.f;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 2;
    }
    else if (section==1)
    {
        return 1;
    }
    else
    {
        return 1;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell ==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    NSArray * textOneArr= @[@"父母圈",@"成长日记"];
    NSArray * imageOneArr= @[@"discovery_fmchat",@"discovery_growup"];
    
    UIImageView * leftImageView = [[UIImageView alloc] init];
    leftImageView.frame = CGRectMake(10, 12, 21, 21);
    [cell addSubview:leftImageView];
    
    UILabel * leftLable = [[UILabel alloc] init];
    leftLable.textAlignment = NSTextAlignmentLeft;
    leftLable.frame = CGRectMake(50, 0, 100, 45);
    leftLable.font = NormalFontWithSize(14);
    leftLable.textColor = KFontColorC;
    [cell addSubview:leftLable];
    
    UILabel * lineLabel = [[UILabel alloc] init];
    lineLabel.backgroundColor = KFontColorE;
    [cell addSubview:lineLabel];
   
    if (indexPath.section == 0)
    {
        leftImageView.image = [UIImage imageNamed:[imageOneArr objectAtIndex:indexPath.row]];
        leftLable.text = [textOneArr objectAtIndex:indexPath.row];
        lineLabel.frame = CGRectMake(10, 44.5, screenWidth, 0.5);
        
        if (indexPath.row == textOneArr.count-1)
        {
            lineLabel.frame = CGRectZero;
        }
    }
    else if (indexPath.section == 1)
    {
        leftImageView.image = [UIImage imageNamed:@"discovery_school"];
        leftLable.text = @"加入学校";
    }
    else
    {
        leftImageView.image = [UIImage imageNamed:@"dicovery_zixun"];
        leftLable.text = @"咨询";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            ParentsChatViewController * PCVC = [[ParentsChatViewController alloc] init];
            [self pushToViewController:PCVC];
        }
        else if (indexPath.row == 1)
        {
            
        }
    }
    else if (indexPath.section == 1)
    {
    
    }
    else if (indexPath.section == 2)
    {

    }
}

@end
