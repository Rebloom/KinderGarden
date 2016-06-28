//
//  ArticleDetailHeaderView.m
//  KinderGarden
//
//  Created by xdcy on 16/6/27.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "ArticleDetailHeaderView.h"
#import "NSString+UIColor.h"
#import "NXMacro.h"

@implementation ArticleDetailHeaderView
@synthesize bgView;
@synthesize topImageView;
@synthesize backBtn;
@synthesize backImageView;
@synthesize shareBtn;
@synthesize shareImageView;
@synthesize lookImageView;
@synthesize lookLabel;
@synthesize firstView;
@synthesize photoImageView;
@synthesize nameLabel;
@synthesize timeLabel;
@synthesize attentionBtn;
@synthesize secondView;
@synthesize contentsLabel;
@synthesize lineLabel;
@synthesize pinglunLabel;
@synthesize jubaoBtn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self createUI];
    }
    
    return self;
}

- (void)createUI
{
    if (!bgView)
    {
        bgView = [[UIView alloc] init];
    }
    bgView.backgroundColor = kBackgroundColor;
    bgView.userInteractionEnabled = YES;
    bgView.frame = CGRectMake(0, 0, screenWidth, 590);
    [self addSubview:bgView];
    
    if (!topImageView)
    {
        topImageView = [[UIImageView alloc] init];
    }
    topImageView.image = [UIImage imageNamed:@"topImageView"];
    topImageView.frame = CGRectMake(0, 0, screenWidth, 330);
    [bgView addSubview:topImageView];
    
    if (!backBtn)
    {
        backBtn = [[UIButton alloc] init];
    }
    backBtn.frame = CGRectMake(0, 30, 50, 50);
    backBtn.backgroundColor = [UIColor clearColor];
    [backBtn addTarget:self action:@selector(backBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:backBtn];
    
    if (!backImageView)
    {
        backImageView = [[UIImageView alloc] init];
    }
    backImageView.frame = CGRectMake(20,0, 10, 20);
    backImageView.image = [UIImage imageNamed:@"返回"];
    [backBtn addSubview:backImageView];
    
    if (!shareBtn)
    {
        shareBtn = [[UIButton alloc] init];
    }
    shareBtn.frame = CGRectMake(screenWidth-70, 30, 70, 60);
    shareBtn.backgroundColor = [UIColor clearColor];
    [shareBtn addTarget:self action:@selector(shareBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:shareBtn];
    
    if (!shareImageView)
    {
        shareImageView = [[UIImageView alloc] init];
    }
    shareImageView.frame = CGRectMake(screenWidth-50,30, 40, 40);
    shareImageView.image = [UIImage imageNamed:@"分享"];
    [bgView addSubview:shareImageView];
    
    if (!lookImageView)
    {
        lookImageView = [[UIImageView alloc] init];
    }
    lookImageView.image = [UIImage imageNamed:@"看过"];
    lookImageView.frame = CGRectMake(screenWidth-80-20, 270, 20, 14);
    [bgView addSubview:lookImageView];
    
    if (!lookLabel)
    {
        lookLabel = [[UILabel alloc] init];
    }
    lookLabel.frame = CGRectMake(CGRectGetMaxX(lookImageView.frame)+5, 260, 80, 30);
    lookLabel.textAlignment = NSTextAlignmentLeft;
    lookLabel.textColor = KFontColorC;
    lookLabel.text = @"387人看过";
    lookLabel.font = NormalFontWithSize(14);
    [bgView addSubview:lookLabel];
    
    if (!firstView)
    {
        firstView = [[UIView alloc] init];
    }
    firstView.backgroundColor = KFontColorA;
    firstView.frame = CGRectMake(20, CGRectGetMaxY(topImageView.frame)-20, screenWidth-40, 65);
    [bgView addSubview:firstView];
    
    if (!photoImageView)
    {
        photoImageView = [[UIImageView alloc] init];
    }
    photoImageView.image = [UIImage imageNamed:@"beauty3.jpg"];
    photoImageView.layer.masksToBounds = YES;
    photoImageView.layer.cornerRadius = 20;
    photoImageView.frame = CGRectMake(20, 10, 40, 40);
    [firstView addSubview:photoImageView];
    
    if(!nameLabel)
    {
        nameLabel = [[UILabel alloc] init];
    }
    nameLabel.frame = CGRectMake(CGRectGetMaxX(photoImageView.frame)+10, 15, 150, 20);
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = KFontColorC;
    nameLabel.text = @"半杯咖啡@jing";
    nameLabel.font = NormalFontWithSize(15);
    [firstView addSubview:nameLabel];
    
    if(!timeLabel)
    {
        timeLabel = [[UILabel alloc] init];
    }
    timeLabel.frame = CGRectMake(CGRectGetMaxX(photoImageView.frame)+10, 35, 150, 15);
    timeLabel.textAlignment = NSTextAlignmentLeft;
    timeLabel.textColor = KFontColorB;
    timeLabel.text = @"2小时前";
    timeLabel.font = NormalFontWithSize(11);
    [firstView addSubview:timeLabel];
  
    if (!attentionBtn)
    {
        attentionBtn = [[UIButton alloc] init];
    }
    attentionBtn.frame = CGRectMake(CGRectGetWidth(firstView.frame)-87, 15, 75, 35);
    attentionBtn.layer.cornerRadius = 17.5;
    attentionBtn.layer.masksToBounds = YES;
    attentionBtn.titleLabel.font = NormalFontWithSize(13);
    [attentionBtn setBackgroundImage:[UIImage imageNamed:@"未关注按钮"] forState:UIControlStateNormal];
    [attentionBtn setTitle:@"关注" forState:UIControlStateNormal];
    [attentionBtn setTitleColor:KPurpleColor forState:UIControlStateNormal];
    [attentionBtn addTarget:self action:@selector(attentionBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [firstView addSubview:attentionBtn];
    
    isSelect = NO;
    
    if (!secondView)
    {
        secondView = [[UIView alloc] init];
    }
    secondView.backgroundColor = KFontColorA;
    secondView.frame = CGRectMake(0, CGRectGetMaxY(firstView.frame)+10, screenWidth, 160);
    [bgView addSubview:secondView];

    if(!contentsLabel)
    {
        contentsLabel = [[UILabel alloc] init];
    }
    contentsLabel.frame = CGRectMake(10, 10, screenWidth-20, 90);
    contentsLabel.textAlignment = NSTextAlignmentLeft;
    contentsLabel.textColor = KFontColorB;
    contentsLabel.text = @"青山绿水是苦丁茶的一种——小叶苦丁。清凉降火的效果明显，没有大叶苦丁那种强烈的苦涩味，又有绿茶的清甜。冲泡之后色泽碧绿，小叶苦丁茶俗称“青山绿水”，是本犀科女贞属乔木植物";
    contentsLabel.numberOfLines = 0;
    contentsLabel.font = NormalFontWithSize(13);
    [secondView addSubview:contentsLabel];

    if (!lineLabel)
    {
        lineLabel = [[UILabel alloc] init];
    }
    lineLabel.backgroundColor = KFontColorE;
    lineLabel.frame = CGRectMake(0, 100, screenWidth, 0.5);
    [secondView addSubview:lineLabel];
    
    if (!jubaoBtn)
    {
        jubaoBtn = [[UIButton alloc] init];
    }
    jubaoBtn.titleLabel.font = NormalFontWithSize(13);
    [jubaoBtn setTitle:@"我要举报" forState:UIControlStateNormal];
    [jubaoBtn setTitleColor:KFontColorD forState:UIControlStateNormal];
    jubaoBtn.frame = CGRectMake(screenWidth-65, CGRectGetMaxY(lineLabel.frame)+30, 65, 30);
    [jubaoBtn addTarget:self action:@selector(jubaoBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [secondView addSubview:jubaoBtn];
    
    if (!pinglunLabel)
    {
        pinglunLabel = [[UILabel alloc] init];
    }
    pinglunLabel.frame = CGRectMake(20, CGRectGetMaxY(secondView.frame)+5, screenWidth-30, 35);
    pinglunLabel.textAlignment = NSTextAlignmentLeft;
    contentsLabel.backgroundColor = [UIColor clearColor];
    pinglunLabel.textColor = KFontColorB;
    pinglunLabel.text = @"评论 23";
    pinglunLabel.font = NormalFontWithSize(13);
    [bgView addSubview:pinglunLabel];
}

- (void)attentionBtnOnClick:(UIButton*)sender
{
    if (isSelect)
    {
        [attentionBtn setBackgroundImage:[UIImage imageNamed:@"未关注按钮"] forState:UIControlStateNormal];
        [attentionBtn setTitle:@"关注" forState:UIControlStateNormal];
        [attentionBtn setTitleColor:KPurpleColor forState:UIControlStateNormal];
        
        isSelect = NO;
    }
    else
    {
        [attentionBtn setBackgroundImage:[UIImage imageNamed:@"已经关注"] forState:UIControlStateNormal];
        [attentionBtn setTitle:@"已关注" forState:UIControlStateNormal];
        [attentionBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
        
        isSelect = YES;
    }
    
    if ([self.delegate respondsToSelector:@selector(attentiontoBtnClick)])
    {
        [self.delegate attentiontoBtnClick];
    }
}

- (void)jubaoBtnOnClick
{
    if ([self.delegate respondsToSelector:@selector(jubaoBtnClick)])
    {
        [self.delegate jubaoBtnClick];
    }
}

- (void)backBtnOnClick
{
    if ([self.delegate respondsToSelector:@selector(backtoBtnClick)])
    {
        [self.delegate backtoBtnClick];
    }
}

- (void)shareBtnOnClick
{
    if ([self.delegate respondsToSelector:@selector(shareBtnClick)])
    {
        [self.delegate shareBtnClick];
    }
}

@end
