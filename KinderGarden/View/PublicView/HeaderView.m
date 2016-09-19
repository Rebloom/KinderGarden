//
//  HeaderView.m
//  XDCY
//
//  Created by 孤星之殇 on 15/8/17.
//  Copyright (c) 2015年 孤星之殇. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView
@synthesize delegate;
@synthesize buttonSelected;

- (void)dealloc
{
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setStatusBarColor:(UIColor *)color
{
    UIView * statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 20)];
    statusBarView.backgroundColor = color;
    [self addSubview:statusBarView];
    [statusBarView release];
    
    [self setBackgroundColor:color];
}

- (void)loadComponentsWithTitle:(NSString *)title
{
    [self loadComponentsWithTitle:title withTitleColor:[UIColor whiteColor]];
}

- (void)loadComponentsWithTitle:(NSString *)title withTitleColor:(UIColor*)titleColor
{
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, screenWidth, 24)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = title;
    titleLabel.textColor = titleColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = NormalFontWithSize(17);
    [self addSubview:titleLabel];
    [titleLabel release];
    
    [self setBackgroundColor:KPurpleColor];
}

- (void)backButton
{
    UIButton * backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 60, 40)];
    backButton.tag = 1;
    UIImageView * backImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 30, 10, 20)];
    [backImage setBackgroundColor:[UIColor clearColor]];
    backImage.image = [UIImage imageNamed:@"back"];
    [self addSubview:backImage];
    [backImage release];
    [backButton addTarget:self action:@selector(headerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backButton];
    [backButton release];
}

- (void)contactBtn
{
    UIButton * contactBtn = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth-60,20, 60, 40)];
    contactBtn.tag = 2;
    [contactBtn setTitle:@"通讯录" forState:UIControlStateNormal];
    contactBtn.titleLabel.font = NormalFontWithSize(15);
    [contactBtn addTarget:self action:@selector(headerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:contactBtn];
    [contactBtn release];
}

- (void)addRightBtnWithBtnName:(NSString *)name
{
    UIButton * rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth-60,20, 60, 40)];
    rightBtn.tag = 2;
    [rightBtn setTitle:name forState:UIControlStateNormal];
    rightBtn.titleLabel.font = NormalFontWithSize(15);
    [rightBtn addTarget:self action:@selector(headerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightBtn];
    [rightBtn release];
}

- (void)publishButton
{
    UIButton * publishBtn = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth-60,20, 60, 40)];
    publishBtn.tag = 2;
    [publishBtn setTitle:@"发布" forState:UIControlStateNormal];
    [publishBtn addTarget:self action:@selector(headerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:publishBtn];
    [publishBtn release];
}

- (void)headerButtonClicked:(id)sender
{
    UIButton * btn = (UIButton *)sender;
    if ([self.delegate respondsToSelector:@selector(buttonClicked:)])
    {
        [self.delegate buttonClicked:btn];
    }
}

@end