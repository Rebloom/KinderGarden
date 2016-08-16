//
//  SelectClssView.m
//  KinderGarden
//
//  Created by xdcy on 16/7/5.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "SelectClssView.h"
#import "NXMacro.h"
#import "NSString+UIColor.h"
#import "UIImage+UIColor.h"

@implementation SelectClssView
@synthesize hideBtn;
@synthesize mainView;
@synthesize isShow;
@synthesize rowNum;
@synthesize classArr;
@synthesize delegate;

- (void)dealloc
{
}

+(SelectClssView*)defaultSelectClssView
{
    static SelectClssView * defaultSelectClssView = nil;
    if (!defaultSelectClssView)
    {
        defaultSelectClssView = [[SelectClssView alloc] init];
    }
    
    return defaultSelectClssView;
}

- (void)showView
{
    isShow = YES;
    mainView.hidden = NO;
    selectTableView.hidden = NO;
}

-(void)hideView
{
    isShow = NO;
    mainView.hidden = YES;
    selectTableView.hidden = YES;
}

- (id)init
{
    self = [super init];
    
    return self;
}

- (id)initWithArray:(NSArray*)arr withDelegate:(id)_delegate
{
    [self clearSubview];

    if (self = [super init])
    {
        classArr = [arr mutableCopy];
       
        indexNum = 100;
        if (!selectDict)
        {
            selectDict = [[NSMutableDictionary alloc] init];
        }
        
        if (!mainView)
        {
            mainView = [[UIView alloc] init];
        }
        mainView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
        mainView.backgroundColor = [KFontColorC colorWithAlphaComponent:0.3];
        [self addSubview:mainView];
        [[UIApplication sharedApplication].keyWindow addSubview:mainView];

        if (!hideBtn)
        {
            hideBtn = [[UIButton alloc] init];
        }
        hideBtn.frame = CGRectMake(0, 0, screenWidth, screenHeight);
        hideBtn.backgroundColor = [UIColor clearColor];
        [hideBtn addTarget:self action:@selector(hideBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
        [mainView addSubview:hideBtn];
        
        selectTableView = [[UITableView alloc] initWithFrame:CGRectMake((screenWidth-270)/2, 64, 270, 100+30*(classArr.count)) style:UITableViewStylePlain];
        selectTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        selectTableView.delegate = self;
        selectTableView.scrollEnabled = NO;
        selectTableView.dataSource = self;
        [mainView addSubview:selectTableView];
        
        UIView * headerView = [[UIView alloc] init];
        headerView.frame = CGRectMake(0, 22, CGRectGetWidth(selectTableView.frame), 50);
        selectTableView.tableHeaderView = headerView;
        
        UILabel * titleLabel = [[UILabel alloc] init];
        titleLabel.frame = CGRectMake(0, 0,  CGRectGetWidth(selectTableView.frame), 50);
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = KFontColorB;
        titleLabel.text = @"选择班级";
        titleLabel.font = MediumSTFontWithSize(15);
        [headerView addSubview:titleLabel];
        
        UIView * footView = [[UIView alloc] init];
        footView.frame = CGRectMake(0, CGRectGetHeight(selectTableView.frame)- 50, CGRectGetWidth(selectTableView.frame), 50);
        selectTableView.tableFooterView = footView;
        
        UIButton * finishBtn = [[UIButton alloc] init];
        finishBtn.frame = CGRectMake(0, 0, CGRectGetWidth(selectTableView.frame), 50);
        [finishBtn setTitle:@"完成" forState:UIControlStateNormal];
        [finishBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
        finishBtn.backgroundColor = KPurpleColor;
        finishBtn.titleLabel.font = NormalFontWithSize(15);
        [finishBtn addTarget:self action:@selector(finishBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
        [footView addSubview:finishBtn];
        
        [self showView];
        self.delegate = _delegate;
    }
    self.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return classArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * selectID = @"selectID";
    SelectClassCell * cell = [tableView dequeueReusableCellWithIdentifier:selectID];
    if (!cell)
    {
        cell = [[SelectClassCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:selectID];
    }
    cell.backgroundColor = KFontColorA;
    
    cell.classLabel.frame = CGRectMake(25, 0, 100, 30);
    cell.selectImageView.frame = CGRectMake(CGRectGetWidth(selectTableView.frame)-37-10, CGRectGetMinY(cell.classLabel.frame)+10, 10.5, 10.5);
    cell.classLabel.text = [classArr objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSInteger index = [[selectDict objectForKey:@"YES"] integerValue];
    
    if (indexPath.row == index)
    {
        cell.selectImageView.image = [UIImage imageNamed:@"班级选择"];
    }
    else
    {
        cell.selectImageView.image = [UIImage imageNamed:@"班级未选中"];
    }

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    indexNum = indexPath.row;
    [selectDict setObject:[NSString stringWithFormat:@"%ld",(long)indexNum] forKey:@"YES"];
    
    [selectTableView reloadData];
}

//隐藏视图
- (void)hideBtnOnClick
{
    if ([self.delegate respondsToSelector:@selector(hideClicked)])
    {
        [self.delegate hideClicked];
    }
}

//完成
- (void)finishBtnOnClick
{
    if ([self.delegate respondsToSelector:@selector(finishClick:)])
    {
        [self.delegate finishClick:[classArr objectAtIndex:indexNum]];
    }
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
    if (selectTableView)
    {
        for (UIView * view in selectTableView.subviews)
        {
            [view removeFromSuperview];
        }
    }
}

@end
