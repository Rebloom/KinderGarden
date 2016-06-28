//
//  MineHostHeaderView.m
//  KinderGarden
//
//  Created by xdcy on 16/6/24.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "MineHostHeaderView.h"
#import "NXMacro.h"
#import "NSString+UIColor.h"

@implementation MineHostHeaderView

@synthesize bgImageView;
@synthesize picImageView;
@synthesize photoImageView;
@synthesize setImageView;
@synthesize placeImageView;
@synthesize nameLabel;
@synthesize placeLabel;
@synthesize fangkeLabel;
@synthesize lookImageView;
@synthesize liulanLabel;
@synthesize alphaView;
@synthesize photoNumLabel;
@synthesize photoLabel;
@synthesize guanzhuNumLabel;
@synthesize guanzhuLabel;
@synthesize funsNumLabel;
@synthesize funsLabel;
@synthesize verOneLabel;
@synthesize verTwoLabel;
@synthesize photoBtn;
@synthesize guanzhuBtn;
@synthesize funsBtn;
@synthesize wodeTieziBtn;
@synthesize ILookBtn;
@synthesize backBtn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self)
    {
        [self createUI];
    }
    
    return self;
}

- (void)createUI
{
    if (!bgImageView)
    {
        bgImageView = [[UIImageView alloc] init];
    }
    bgImageView.frame = CGRectMake(0, 0, screenWidth, 320);
    bgImageView.userInteractionEnabled = YES;
    bgImageView.image = [UIImage imageNamed:@"beauty1.jpg"];
    [self addSubview:bgImageView];
    
    UIView * blackView = [[UIView alloc] init];
    blackView.backgroundColor = [KFontColorC colorWithAlphaComponent:0.4];
    blackView.frame = CGRectMake(0, 0, screenWidth, 320);
    [bgImageView addSubview:blackView];
    
    if (!picImageView)
    {
        picImageView = [[UIImageView alloc] init];
    }
    picImageView.image = [UIImage imageNamed:@"背景图片"];
    picImageView.frame = CGRectMake(screenWidth/2-25-20-37.5, 125, 20, 15);
    [bgImageView addSubview:picImageView];
    
    if (!backBtn)
    {
        backBtn = [[UIButton alloc] init];
    }
    backBtn.frame = CGRectMake(0, 30, 50, 50);
    backBtn.backgroundColor = [UIColor clearColor];
    [backBtn addTarget:self action:@selector(backBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [bgImageView addSubview:backBtn];
    
    
    if (!backImageView)
    {
        backImageView = [[UIImageView alloc] init];
    }
    backImageView.frame = CGRectMake(20,0, 10, 20);
    backImageView.image = [UIImage imageNamed:@"返回"];
    [backBtn addSubview:backImageView];
    
    if (!photoImageView)
    {
        photoImageView = [[UIImageView alloc] init];
    }
    photoImageView.frame = CGRectMake(screenWidth/2-37.5, 100, 75, 75);
    photoImageView.image = [UIImage imageNamed:@"beauty2.jpg"];
    photoImageView.layer.cornerRadius = 75/2;
    photoImageView.layer.masksToBounds = YES;
    photoImageView.layer.borderColor = KFontColorA.CGColor;
    photoImageView.layer.borderWidth = 2.f;
    [bgImageView addSubview:photoImageView];

    if (!setImageView)
    {
        setImageView = [[UIImageView alloc] init];
    }
    setImageView.frame = CGRectMake(screenWidth/2+37.5+20, 125, 18, 18);
    setImageView.image = [UIImage imageNamed:@"设置"];
    [bgImageView addSubview:setImageView];
    
    if (!nameLabel)
    {
        nameLabel = [[UILabel alloc] init];
    }
    nameLabel.frame = CGRectMake(0, CGRectGetMaxY(photoImageView.frame)+2, screenWidth, 20);
    nameLabel.font = NormalFontWithSize(17);
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.textColor = KFontColorA;
    nameLabel.text = @"Grilffith";
    [bgImageView addSubview:nameLabel];
    
    if (!placeImageView)
    {
        placeImageView = [[UIImageView alloc] init];
    }
    placeImageView.frame = CGRectMake(screenWidth/2-25-9, 200, 9, 13);
    placeImageView.image = [UIImage imageNamed:@"定位"];
    [bgImageView addSubview:placeImageView];
    
    if (!placeLabel)
    {
        placeLabel = [[UILabel alloc] init];
    }
    placeLabel.frame = CGRectMake(CGRectGetMaxX(placeImageView.frame)+5, CGRectGetMinY(placeImageView.frame), 100, 13);
    placeLabel.font = NormalFontWithSize(12);
    placeLabel.textAlignment = NSTextAlignmentLeft;
    placeLabel.textColor = KFontColorA;
    placeLabel.text = @"北京市 昌平区";
    [bgImageView addSubview:placeLabel];
    
    if (!fangkeLabel)
    {
        fangkeLabel = [[UILabel alloc] init];
    }
    fangkeLabel.frame = CGRectMake(0, 220, screenWidth-15,20 );
    fangkeLabel.font = NormalFontWithSize(14);
    fangkeLabel.textAlignment = NSTextAlignmentRight;
    fangkeLabel.textColor = KFontColorA;
    fangkeLabel.text = @"你是今天第23个访客";
    [bgImageView addSubview:fangkeLabel];
    
    if (!lookImageView)
    {
        lookImageView = [[UIImageView alloc] init];
    }
    lookImageView.frame = CGRectMake(screenWidth-140, 245, 20, 14);
    lookImageView.image = [UIImage imageNamed:@"看过"];
    [bgImageView addSubview:lookImageView];

    if (!liulanLabel)
    {
        liulanLabel = [[UILabel alloc] init];
    }
    liulanLabel.frame = CGRectMake(CGRectGetMaxX(lookImageView.frame)+5, CGRectGetMaxY(fangkeLabel.frame), 100,18 );
    liulanLabel.font = NormalFontWithSize(14);
    liulanLabel.textAlignment = NSTextAlignmentLeft;
    liulanLabel.textColor = KFontColorA;
    liulanLabel.text = @"总浏览量 30043";
    [bgImageView addSubview:liulanLabel];
    
    if (!fangkeBtn)
    {
        fangkeBtn = [[UIButton alloc] init];
    }
    fangkeBtn.frame = CGRectMake(screenWidth-100, 220, 100, 40);
    fangkeBtn.backgroundColor = [UIColor clearColor];
    [fangkeBtn addTarget:self action:@selector(fangkeBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgImageView addSubview:fangkeBtn];
    
    if (!alphaView)
    {
        alphaView = [[UIView alloc] init];
    }
    alphaView.backgroundColor = [KFontColorC colorWithAlphaComponent:0.40];
    alphaView.frame = CGRectMake(0, 260, screenWidth, 60);
    [bgImageView addSubview:alphaView];
    
    if (!photoNumLabel)
    {
        photoNumLabel = [[UILabel alloc] init];
    }
    photoNumLabel.frame = CGRectMake(0, 15, screenWidth/3,20 );
    photoNumLabel.font = NormalFontWithSize(18);
    photoNumLabel.textAlignment = NSTextAlignmentCenter;
    photoNumLabel.textColor = KFontColorA;
    photoNumLabel.text = @"387";
    [alphaView addSubview:photoNumLabel];
    
    if (!photoLabel)
    {
        photoLabel = [[UILabel alloc] init];
    }
    photoLabel.frame = CGRectMake(0, CGRectGetMaxY(photoNumLabel.frame), screenWidth/3,20 );
    photoLabel.font = NormalFontWithSize(14);
    photoLabel.textAlignment = NSTextAlignmentCenter;
    photoLabel.textColor = KFontColorA;
    photoLabel.text = @"照片";
    [alphaView addSubview:photoLabel];
    
    if (!guanzhuNumLabel)
    {
        guanzhuNumLabel = [[UILabel alloc] init];
    }
    guanzhuNumLabel.frame = CGRectMake(CGRectGetMaxX(photoNumLabel.frame), CGRectGetMinY(photoNumLabel.frame), CGRectGetWidth(photoNumLabel.frame),CGRectGetHeight(photoNumLabel.frame) );
    guanzhuNumLabel.font = NormalFontWithSize(18);
    guanzhuNumLabel.textAlignment = NSTextAlignmentCenter;
    guanzhuNumLabel.textColor = KFontColorA;
    guanzhuNumLabel.text = @"10387";
    [alphaView addSubview:guanzhuNumLabel];
    
    if (!guanzhuLabel)
    {
        guanzhuLabel = [[UILabel alloc] init];
    }
    guanzhuLabel.frame = CGRectMake(CGRectGetMaxX(photoLabel.frame), CGRectGetMinY(photoLabel.frame), CGRectGetWidth(photoLabel.frame),CGRectGetHeight(photoLabel.frame) );
    guanzhuLabel.font = NormalFontWithSize(14);
    guanzhuLabel.textAlignment = NSTextAlignmentCenter;
    guanzhuLabel.textColor = KFontColorA;
    guanzhuLabel.text = @"关注";
    [alphaView addSubview:guanzhuLabel];
    
    if (!funsNumLabel)
    {
        funsNumLabel = [[UILabel alloc] init];
    }
    funsNumLabel.frame = CGRectMake(CGRectGetMaxX(guanzhuNumLabel.frame), CGRectGetMinY(photoNumLabel.frame), CGRectGetWidth(photoNumLabel.frame),CGRectGetHeight(photoNumLabel.frame) );
    funsNumLabel.font = NormalFontWithSize(18);
    funsNumLabel.textAlignment = NSTextAlignmentCenter;
    funsNumLabel.textColor = KFontColorA;
    funsNumLabel.text = @"187";
    [alphaView addSubview:funsNumLabel];
    
    if (!funsLabel)
    {
        funsLabel = [[UILabel alloc] init];
    }
    funsLabel.frame = CGRectMake(CGRectGetMaxX(guanzhuLabel.frame), CGRectGetMinY(photoLabel.frame), CGRectGetWidth(photoLabel.frame),CGRectGetHeight(photoLabel.frame) );
    funsLabel.font = NormalFontWithSize(14);
    funsLabel.textAlignment = NSTextAlignmentCenter;
    funsLabel.textColor = KFontColorA;
    funsLabel.text = @"粉丝";
    [alphaView addSubview:funsLabel];
    
    if (!verOneLabel)
    {
        verOneLabel = [[UILabel alloc] init];
    }
    verOneLabel.frame = CGRectMake(screenWidth/3, 15, 0.5, 40);
    verOneLabel.backgroundColor = KFontColorE;
    [alphaView addSubview:verOneLabel];
    
    if (!verTwoLabel)
    {
        verTwoLabel = [[UILabel alloc] init];
    }
    verTwoLabel.frame = CGRectMake(screenWidth*2/3, 15, 0.5, 40);
    verTwoLabel.backgroundColor = KFontColorE;
    [alphaView addSubview:verTwoLabel];

    if (!photoBtn)
    {
        photoBtn = [[UIButton alloc] init];
    }
    photoBtn.frame = CGRectMake(0, 0, screenWidth/3, 70);
    photoBtn.backgroundColor = [UIColor clearColor];
    [photoBtn addTarget:self action:@selector(photoBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [alphaView addSubview:photoBtn];
    
    if (!guanzhuBtn)
    {
        guanzhuBtn = [[UIButton alloc] init];
    }
    guanzhuBtn.frame = CGRectMake( screenWidth/3, 0, screenWidth/3, 70);
    guanzhuBtn.backgroundColor = [UIColor clearColor];
    [guanzhuBtn addTarget:self action:@selector(guanzhuBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [alphaView addSubview:guanzhuBtn];
    
    if (!funsBtn)
    {
        funsBtn = [[UIButton alloc] init];
    }
    funsBtn.frame = CGRectMake( 2*screenWidth/3, 0, screenWidth/3, 70);
    funsBtn.backgroundColor = [UIColor clearColor];
    [funsBtn addTarget:self action:@selector(funsBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [alphaView addSubview:funsBtn];
    
    if (!wodeTieziBtn)
    {
        wodeTieziBtn = [[UIButton alloc] init];
    }
    wodeTieziBtn.frame = CGRectMake(0, CGRectGetMaxY(alphaView.frame)+10, screenWidth/2, 60);
    wodeTieziBtn.backgroundColor = KFontColorA;
    wodeTieziBtn.titleLabel.font = NormalFontWithSize(14);
    [wodeTieziBtn setTitle:@"我的帖子" forState:UIControlStateNormal];
    [wodeTieziBtn setTitleColor:KFontColorC forState:UIControlStateNormal];
    [wodeTieziBtn addTarget:self action:@selector(wodeTieziBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:wodeTieziBtn];
    
    if (!ILookBtn)
    {
        ILookBtn = [[UIButton alloc] init];
    }
    ILookBtn.frame = CGRectMake(screenWidth/2, CGRectGetMaxY(alphaView.frame)+10, screenWidth/2, 60);
    ILookBtn.backgroundColor = KFontColorA;
    ILookBtn.titleLabel.font = NormalFontWithSize(14);
    [ILookBtn setTitle:@"我看过谁" forState:UIControlStateNormal];
    [ILookBtn setTitleColor:KFontColorB forState:UIControlStateNormal];
    [ILookBtn addTarget:self action:@selector(ILookBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:ILookBtn];
}

//我的帖子
- (void)wodeTieziBtnOnClick:(UIButton*)sender
{    
    [wodeTieziBtn setTitleColor:KFontColorC forState:UIControlStateNormal];
    [ILookBtn setTitleColor:KFontColorB forState:UIControlStateNormal];
    
    if ([self.delegate respondsToSelector:@selector(wodeTieziBtnClick)])
    {
        [self.delegate wodeTieziBtnClick];
    }
}

//返回
- (void)backBtnOnClick
{
    if ([self.delegate respondsToSelector:@selector(backBtnClick)])
    {
        [self.delegate backBtnClick];
    }
}

//我看过谁
- (void)ILookBtnOnClick:(UIButton*)sender
{
    [wodeTieziBtn setTitleColor:KFontColorB forState:UIControlStateNormal];
    [ILookBtn setTitleColor:KFontColorC forState:UIControlStateNormal];
    
    if ([self.delegate respondsToSelector:@selector(ILookBtnClick)])
    {
        [self.delegate ILookBtnClick];
    }
}

//查看访客
- (void)fangkeBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(fangkeBtnClick)])
    {
        [self.delegate fangkeBtnClick];
    }
}

//照片
- (void)photoBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(photoBtnClick)])
    {
        [self.delegate photoBtnClick];
    }
}

//关注
- (void)guanzhuBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(guanzhuBtnClick)])
    {
        [self.delegate guanzhuBtnClick];
    }
}

//粉丝
- (void)funsBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(funsBtnClick)])
    {
        [self.delegate funsBtnClick];
    }
}

@end
