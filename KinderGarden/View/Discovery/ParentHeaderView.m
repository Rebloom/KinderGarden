//
//  ParentHeaderView.m
//  KinderGarden
//
//  Created by xdcy on 16/6/23.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "ParentHeaderView.h"
#import "NXMacro.h"
#import "NSString+UIColor.h"

#define NewTopic   @"newTopic"
#define Recommend  @"recommend"
#define Mine       @"mine"

@implementation ParentHeaderView
@synthesize topView;
@synthesize lunboImageView;
@synthesize photoImageView;
@synthesize nameLabel;
@synthesize lineLabel;
@synthesize guanzhuLabel;
@synthesize fensiLabel;
@synthesize mineBtn;
@synthesize recommendBtn;
@synthesize newsBtn;
@synthesize mineHostBtn;
@synthesize backBtn;
@synthesize backImageView;

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
    if (!topView)
    {
        topView = [[UIView alloc] init];
    }
    topView.frame = CGRectMake(0, 0, screenWidth, 450);
    topView.backgroundColor = KFontColorA;
    [self addSubview:topView];
    
    if (!lunboImageView)
    {
        lunboImageView = [[UIImageView alloc] init];
    }
    lunboImageView.backgroundColor = kBackgroundColor;
    lunboImageView.image = [UIImage imageNamed:@"newsImageView"];
    lunboImageView.frame = CGRectMake(0, 0, screenWidth, 238);
    [self addSubview:lunboImageView];
    
    if (!photoImageView)
    {
        photoImageView = [[UIImageView alloc] init];
    }
    photoImageView.frame = CGRectMake(screenWidth/2-35, CGRectGetMaxY(lunboImageView.frame)+10, 70, 70);
    photoImageView.layer.cornerRadius = 35;
    photoImageView.layer.masksToBounds = YES;
    photoImageView.image = [UIImage imageNamed:@"beauty3.jpg"];
    [topView addSubview:photoImageView];
    
    if (!backBtn)
    {
        backBtn = [[UIButton alloc] init];
    }
    backBtn.frame = CGRectMake(0, 30, 50, 50);
    backBtn.backgroundColor = [UIColor clearColor];
    [backBtn addTarget:self action:@selector(backBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backBtn];
    
    
    if (!backImageView)
    {
        backImageView = [[UIImageView alloc] init];
    }
    backImageView.frame = CGRectMake(20,0, 10, 20);
    backImageView.image = [UIImage imageNamed:@"返回"];
    [backBtn addSubview:backImageView];
    
    if (!mineHostBtn)
    {
        mineHostBtn = [[UIButton alloc] init];
    }
    [mineHostBtn setBackgroundColor:[UIColor clearColor]];
    mineHostBtn.frame = CGRectMake(0, CGRectGetMaxY(lunboImageView.frame), screenWidth, 160);
    [mineHostBtn addTarget:self action:@selector(mineHostBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:mineHostBtn];
    
    if (!nameLabel)
    {
        nameLabel = [[UILabel alloc] init];
    }
    nameLabel.text = @"半杯咖啡@jing";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.frame = CGRectMake(0, CGRectGetMaxY(photoImageView.frame)+10, screenWidth, 20);
    nameLabel.textColor = KFontColorC;
    nameLabel.font = NormalFontWithSize(17);
    [topView addSubview:nameLabel];
    
    if (!guanzhuLabel)
    {
        guanzhuLabel = [[UILabel alloc] init];
    }
    guanzhuLabel.text = @"关注387";
    guanzhuLabel.textAlignment = NSTextAlignmentRight;
    guanzhuLabel.frame = CGRectMake(0, CGRectGetMaxY(nameLabel.frame)+10, screenWidth/2-15, 20);
    guanzhuLabel.textColor = KFontColorB;
    guanzhuLabel.font = NormalFontWithSize(12);
    [topView addSubview:guanzhuLabel];
    
    if (!fensiLabel)
    {
        fensiLabel = [[UILabel alloc] init];
    }
    fensiLabel.text = @"粉丝2384";
    fensiLabel.textAlignment = NSTextAlignmentLeft;
    fensiLabel.frame = CGRectMake(screenWidth/2+15, CGRectGetMaxY(nameLabel.frame)+10, screenWidth/2-15, 20);
    fensiLabel.textColor = KFontColorB;
    fensiLabel.font = NormalFontWithSize(12);
    [topView addSubview:fensiLabel];
    
    if (!lineLabel)
    {
        lineLabel = [[UILabel alloc] init];
    }
    lineLabel.frame = CGRectMake(screenWidth/2, CGRectGetMaxY(nameLabel.frame)+10, 0.5, 15);
    lineLabel.backgroundColor = KFontColorE;
    [topView addSubview:lineLabel];
    
    UIView * grayView = [[UIView alloc] init];
    grayView.backgroundColor = kBackgroundColor;
    grayView.frame = CGRectMake(0, 400, screenWidth, 10);
    [topView addSubview:grayView];
    
    UIView * bannerView = [[UIView alloc] init];
    bannerView.frame = CGRectMake(0, CGRectGetMaxY(grayView.frame), screenWidth, 40);
    [topView addSubview:bannerView];
    
    if (!newsBtn)
    {
        newsBtn = [[UIButton alloc] init];
    }
    newsBtn.frame = CGRectMake(0, CGRectGetMaxY(grayView.frame), screenWidth/3, 40);
    newsBtn.titleLabel.font = MiddleFontWithSize(14);
    [newsBtn setTitle:@"最新话题" forState:UIControlStateNormal];
    [newsBtn setTitleColor:KFontColorC forState:UIControlStateNormal];
    [newsBtn addTarget:self action:@selector(newsBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:newsBtn];
    
    
    if (!recommendBtn)
    {
        recommendBtn = [[UIButton alloc] init];
    }
    recommendBtn.frame = CGRectMake(screenWidth/3, CGRectGetMaxY(grayView.frame), screenWidth/3, 40);
    recommendBtn.titleLabel.font = NormalFontWithSize(14);
    [recommendBtn setTitle:@"推荐达人" forState:UIControlStateNormal];
    [recommendBtn setTitleColor:KFontColorB forState:UIControlStateNormal];
    [recommendBtn addTarget:self action:@selector(recommendBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:recommendBtn];
   
    if (!mineBtn)
    {
        mineBtn = [[UIButton alloc] init];
    }
    mineBtn.frame = CGRectMake(screenWidth*2/3, CGRectGetMaxY(grayView.frame), screenWidth/3, 40);
    mineBtn.titleLabel.font = NormalFontWithSize(14);
    [mineBtn setTitle:@"我的圈子" forState:UIControlStateNormal];
    [mineBtn setTitleColor:KFontColorB forState:UIControlStateNormal];
    [mineBtn addTarget:self action:@selector(mineBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:mineBtn];
}

//返回
- (void)backBtnOnClick
{
    if ([self.delegate respondsToSelector:@selector(backBtnClick)])
    {
        [self.delegate backBtnClick];
    }
}

- (void)newsBtnClick:(UIButton*)sender
{
    newsBtn.titleLabel.font = MiddleFontWithSize(14);
    recommendBtn.titleLabel.font = NormalFontWithSize(14);
    mineBtn.titleLabel.font = NormalFontWithSize(14);
    
    [newsBtn setTitleColor:KFontColorC forState:UIControlStateNormal];
    [recommendBtn setTitleColor:KFontColorB forState:UIControlStateNormal];
    [mineBtn setTitleColor:KFontColorB forState:UIControlStateNormal];
    
    if ([self.delegate respondsToSelector:@selector(newtopicOnclick)])
    {
        [self.delegate newtopicOnclick];
    }
}

- (void)mineHostBtnOnClick
{
    if ([self.delegate respondsToSelector:@selector(pushNextVC)])
    {
        [self.delegate pushNextVC];
    }
}

- (void)recommendBtnClick:(UIButton*)sender
{
    newsBtn.titleLabel.font = NormalFontWithSize(14);
    recommendBtn.titleLabel.font = MiddleFontWithSize(14);
    mineBtn.titleLabel.font = NormalFontWithSize(14);
    
    [newsBtn setTitleColor:KFontColorB forState:UIControlStateNormal];
    [recommendBtn setTitleColor:KFontColorC forState:UIControlStateNormal];
    [mineBtn setTitleColor:KFontColorB forState:UIControlStateNormal];

    if ([self.delegate respondsToSelector:@selector(tuijianOnclick)])
    {
        [self.delegate tuijianOnclick];
    }
}

- (void)mineBtnClick:(UIButton*)sender
{
    newsBtn.titleLabel.font = NormalFontWithSize(14);
    recommendBtn.titleLabel.font = NormalFontWithSize(14);
    mineBtn.titleLabel.font = MiddleFontWithSize(14);
    
    [newsBtn setTitleColor:KFontColorB forState:UIControlStateNormal];
    [recommendBtn setTitleColor:KFontColorB forState:UIControlStateNormal];
    [mineBtn setTitleColor:KFontColorC forState:UIControlStateNormal];

    if ([self.delegate respondsToSelector:@selector(quanziOnclick)])
    {
        [self.delegate quanziOnclick];
    }
}



@end
