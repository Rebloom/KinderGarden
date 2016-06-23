//
//  LookViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/6/23.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "LookViewController.h"
#define Attention    @"Attention"
#define Funs    @"Funs"
@interface LookViewController ()

@end

@implementation LookViewController

- (void)createTopView
{
    if (!attentionBtn)
    {
        attentionBtn = [[UIButton alloc] init];
    }
    attentionBtn.tag = 2000;
    attentionBtn.frame = CGRectMake(screenWidth/2-100, 20, 100, 44);
    attentionBtn.titleLabel.font = NormalFontWithSize(17);
    [attentionBtn setTitle:@"我看过我" forState:UIControlStateNormal];
    [attentionBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
    [attentionBtn addTarget:self action:@selector(headerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:attentionBtn];
    
    if (!funsBtn)
    {
        funsBtn = [[UIButton alloc] init];
    }
    funsBtn.tag = 2001;
    funsBtn.frame = CGRectMake(CGRectGetMaxX(attentionBtn.frame), 20, 100, 44);
    funsBtn.titleLabel.font = NormalFontWithSize(17);
    [funsBtn setTitle:@"我看过谁" forState:UIControlStateNormal];
    [funsBtn setTitleColor:@"#5450a0".color forState:UIControlStateNormal];
    [funsBtn addTarget:self action:@selector(headerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:funsBtn];
    
    UIImageView *indicatorLabel= [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(attentionBtn.frame), CGRectGetMaxY(attentionBtn.frame)-4, CGRectGetWidth(attentionBtn.frame), 4)];
    indicatorLabel.backgroundColor = KFontColorA;
    indicatorLabel.tag = 250;
    [headerView addSubview:indicatorLabel];
}

- (void)headerBtnClicked:(id)sender
{
    UIButton * btn = (UIButton *)sender;
    
    UIImageView * bView = (UIImageView*)self.view ;
    UIImageView * indicatorLabel = (UIImageView*)[bView viewWithTag:250];
    [UIView animateWithDuration:0.05 animations:^{
        CGRect frame = indicatorLabel.frame;
        frame.origin.x =  (btn.tag-2000)*CGRectGetWidth(attentionBtn.frame)+CGRectGetMinX(attentionBtn.frame);
        indicatorLabel.frame=frame;
    }];
    
    if ([btn isEqual:attentionBtn])
    {
        //谁看过我
        statusFlag = Attention;
        
        [attentionBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
        [funsBtn setTitleColor:@"#5450a0".color forState:UIControlStateNormal];
    }
    else if([btn isEqual:funsBtn])
    {
        //我看过谁
        statusFlag = Funs;
        
        [attentionBtn setTitleColor:@"#5450a0".color forState:UIControlStateNormal];
        [funsBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
    }
    
    [infoTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [headerView loadComponentsWithTitle:@"" withTitleColor:KFontColorA];
    [headerView backButton];
    [self createTopView];
    
    statusFlag = Attention;
    
    NSArray * tempArr = @[@"11",@"12",@"12",@"12",@"12",@"12",@"12",@"12",@"12",@"12"];
    infoArr = [tempArr mutableCopy];
    
    [self createUI];
}

- (void)createUI
{
    if (!infoTableView)
    {
        infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,64, screenWidth, screenHeight-64) style:UITableViewStylePlain];
    }
    infoTableView.delegate = self;
    infoTableView.dataSource = self;
    infoTableView.backgroundColor = kBackgroundColor;
    infoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:infoTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([statusFlag isEqualToString:Attention])
    {
        return infoArr.count;
    }
    else
    {
        return 8;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.f;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * attentionID = @"attentionID";
    
    LookCell * cell = [tableView dequeueReusableCellWithIdentifier:attentionID];
    if (cell == nil)
    {
        cell = [[LookCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:attentionID];
    }
    cell.delegate = self;
    cell.moreBtn.tag = indexPath.row;
    
    return cell;
}

- (void)lookIndex:(NSInteger)index
{
    
}

#pragma mark 左划删除
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [infoArr removeObjectAtIndex:indexPath.row];
        [infoTableView reloadData];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return @"删除";
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
