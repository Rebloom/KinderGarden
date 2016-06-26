//
//  AttentionAndFunsViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/6/23.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "AttentionAndFunsViewController.h"
#define Attention    @"Attention"
#define Funs    @"Funs"

@interface AttentionAndFunsViewController ()

@end

@implementation AttentionAndFunsViewController
@synthesize pushFlag;

- (void)createTopView
{
    if (!attentionBtn)
    {
        attentionBtn = [[UIButton alloc] init];
    }
    attentionBtn.tag = 2000;
    attentionBtn.frame = CGRectMake(screenWidth/2-100, 20, 100, 44);
    attentionBtn.titleLabel.font = MediumSTFontWithSize(17);
    [attentionBtn setTitle:@"我的关注" forState:UIControlStateNormal];
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
    [funsBtn setTitle:@"我的粉丝" forState:UIControlStateNormal];
    [funsBtn setTitleColor:@"#5450a0".color forState:UIControlStateNormal];
    [funsBtn addTarget:self action:@selector(headerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:funsBtn];
    
    UIImageView *indicatorLabel= [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(attentionBtn.frame), CGRectGetMaxY(attentionBtn.frame)-4, CGRectGetWidth(attentionBtn.frame), 4)];
    indicatorLabel.backgroundColor = KFontColorA;
    indicatorLabel.tag = 250;
    [headerView addSubview:indicatorLabel];
    
    if (self.pushFlag == 0)
    {
        //我的关注
        statusFlag = Attention;
        
        [attentionBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
        [funsBtn setTitleColor:@"#5450a0".color forState:UIControlStateNormal];
    }
    else if(self.pushFlag == 1)
    {
        //我的粉丝
        statusFlag = Funs;
        
        [attentionBtn setTitleColor:@"#5450a0".color forState:UIControlStateNormal];
        [funsBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
    }
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
        //我的关注
        statusFlag = Attention;
        
        [attentionBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
        [funsBtn setTitleColor:@"#5450a0".color forState:UIControlStateNormal];
    }
    else if([btn isEqual:funsBtn])
    {
        //我的粉丝
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
    
    if (self.pushFlag == 0)
    {
        statusFlag = Attention;

    }
    else if (self.pushFlag == 1)
    {
        statusFlag = Funs;

    }
    
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
        return 10;
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
    
    AttentionAndFunsCell * cell = [tableView dequeueReusableCellWithIdentifier:attentionID];
    if (cell == nil)
    {
        cell = [[AttentionAndFunsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:attentionID];
    }
    cell.delegate = self;
    cell.attentionBtn.tag = indexPath.row;

    return cell;
}

- (void)attentionIndex:(NSInteger)index
{


}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
