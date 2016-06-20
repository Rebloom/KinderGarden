//
//  CountView.m
//  KinderGarden
//
//  Created by 孤星之殇 on 16/6/2.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "CountView.h"
#import "NSString+UIColor.h"
#import "NXMacro.h"
#import "AppDelegate.h"

@implementation CountView
@synthesize delegate;
@synthesize infoTableView;
@synthesize mainView;
@synthesize topBtn;
@synthesize isShow;

- (void)dealloc
{
}

+(CountView*)defaultShareView
{
    static CountView * defaultCountView = nil;
    if (!defaultCountView)
    {
        defaultCountView = [[CountView alloc] init];
    }
    
    return defaultCountView;
}

- (void)showView
{
    isShow = YES;
    mainView.hidden = NO;
    infoTableView.hidden = NO;
}

-(void)hideView
{
    isShow = NO;
    mainView.hidden = YES;
    infoTableView.hidden = YES;
}

//初始化弹层
- (id)init
{
    self = [super init];
    
    return self;
}

- (id)initViewWithType:(NSString *)type
{
    [self clearSubview];
    
    if (self = [super init])
    {
        tableFlag = type;
        
        if (!mainView)
        {
            mainView = [[UIView alloc] init];
        }
        mainView.userInteractionEnabled = YES;
        mainView.backgroundColor = [UIColor blackColor];
        mainView.alpha = 0.4;
        mainView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
        [[UIApplication sharedApplication].keyWindow addSubview:mainView];
        
        
        UIButton * hideBtn = [[UIButton alloc] init];
        hideBtn.frame = CGRectMake(0, 0, screenWidth, screenHeight);
        [hideBtn setBackgroundColor:[UIColor clearColor]];
        [hideBtn addTarget:self action:@selector(hideView) forControlEvents:UIControlEventTouchUpInside];
        [mainView addSubview:hideBtn];
        
        if (!infoTableView)
        {
            infoTableView = [[UITableView alloc] init];
        }
        infoTableView.delegate = self;
        infoTableView.dataSource = self;
        infoTableView.backgroundColor = KFontColorA;
        infoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [mainView addSubview:infoTableView];

        if ([type isEqualToString:@"1"])
        {
            infoTableView.frame = CGRectMake(0, screenHeight-40*7, screenWidth, 40*7);
        }
        else if ([type isEqualToString:@"2"])
        {
            infoTableView.frame = CGRectMake(0, screenHeight-40*6, screenWidth, 40*6);
        }
        
        UIView * headView = [[UIView alloc] init];
        headView.backgroundColor = KFontColorA;
        headView.frame = CGRectMake(0, 0, screenWidth, 60);
        infoTableView.tableHeaderView = headView;
        
        UILabel * numberLabel = [[UILabel alloc] init];
        numberLabel.textAlignment = NSTextAlignmentLeft;
        numberLabel.textColor = KFontColorC;
        numberLabel.frame = CGRectMake(20, 0, 150, 60);
        numberLabel.text = [NSString stringWithFormat:@"总转发%ld次",(long)1053];
        [headView addSubview:numberLabel];
        
        UIImageView * closeImageView = [[UIImageView alloc] init];
        closeImageView.image = [UIImage imageNamed:@"select_announce"];
        closeImageView.frame = CGRectMake(screenWidth-48, 16, 28, 28);
        [headView addSubview:closeImageView];
        
        UIButton * closeBtn = [[UIButton alloc] init];
        closeBtn.backgroundColor = [UIColor clearColor];
        closeBtn.frame = CGRectMake(screenWidth-48, 0, 48, 50);
        [closeBtn addTarget:self action:@selector(closeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [headView addSubview:closeBtn];
        
        [self showView];
//        self.delegate = delegate;
    }
    
    self.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableFlag isEqualToString:@"1"])
    {
        return 7;
    }
    else if ([tableFlag isEqualToString:@"2"])
    {
        return 6;
    }
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId = @"cellID";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.backgroundColor = KFontColorA;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self hideView];
    
    if ([tableFlag isEqualToString:@"1"])
    {
        if (indexPath.row == 0)
        {
            
        }
        else if (indexPath.row == 1)
        {
        
        }
        else if (indexPath.row == 2)
        {
            
        }
        else if (indexPath.row == 3)
        {
            
        }
        else if (indexPath.row == 4)
        {
            
        }
        else if (indexPath.row == 5)
        {
            
        }
        else if (indexPath.row == 6)
        {
            
        }
    }
    else if ([tableFlag isEqualToString:@"2"])
    {
        if (indexPath.row == 0)
        {
            
        }
        else if (indexPath.row == 1)
        {
            
        }
        else if (indexPath.row == 2)
        {
            
        }
        else if (indexPath.row == 3)
        {
            
        }
        else if (indexPath.row == 4)
        {
            
        }
        else if (indexPath.row == 5)
        {
            
        }
    }
}

// 点击关闭
- (void)closeBtnClicked:(id)sender
{
    [self hideView];
}


//关闭
- (void)funcBtnOnClick:(UIButton*)sender
{
    [self hideView];
}

// 清除视图块子视图
-(void)clearSubview
{
    if (mainView)
    {
        for (UIView * view in mainView.subviews)
        {
            [view removeFromSuperview];
        }
    }
    if (infoTableView)
    {
        for (UIView * view in infoTableView.subviews)
        {
            [view removeFromSuperview];
        }
    }
}

@end
