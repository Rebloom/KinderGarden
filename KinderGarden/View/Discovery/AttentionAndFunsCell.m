//
//  AttentionAndFunsCell.m
//  KinderGarden
//
//  Created by xdcy on 16/6/23.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "AttentionAndFunsCell.h"
#import "NXMacro.h"
#import "NSString+UIColor.h"
#import "UIImage+UIColor.h"

@implementation AttentionAndFunsCell
@synthesize photoImageView;
@synthesize nameLabel;
@synthesize timeLabel;
@synthesize attentionBtn;
@synthesize lineLabel;
- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self createUI];
    }
    
    return self;
}

- (void)createUI
{
    if (!photoImageView)
    {
        photoImageView = [[UIImageView alloc] init];
    }
    photoImageView.frame = CGRectMake(10, 10, 40, 40);
    photoImageView.layer.cornerRadius = 20;
    photoImageView.layer.masksToBounds = YES;
    int x = arc4random()%6;
    photoImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"beauty%ld.jpg",(long)x]];
    [self addSubview:photoImageView];
    
    if (!nameLabel)
    {
        nameLabel = [[UILabel alloc] init];
    }
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = KFontColorC;
    nameLabel.text = @"不长记性in";
    nameLabel.font = NormalFontWithSize(15);
    nameLabel.frame = CGRectMake(CGRectGetMaxX(photoImageView.frame)+10, 16, 100, 20);
    [self addSubview:nameLabel];
    
    if (!timeLabel)
    {
        timeLabel = [[UILabel alloc] init];
    }
    timeLabel.textAlignment = NSTextAlignmentLeft;
    timeLabel.textColor = KFontColorB;
    timeLabel.text = @"2小时前";
    timeLabel.font = NormalFontWithSize(10);
    timeLabel.frame = CGRectMake(CGRectGetMaxX(photoImageView.frame)+10, 36, 100, 14);
    [self addSubview:timeLabel];
    
    if (!lineLabel)
    {
        lineLabel = [[UILabel alloc] init];
    }
    lineLabel.backgroundColor = KFontColorE;
    lineLabel.frame = CGRectMake(0, 59.5, screenWidth, 0.5);
    [self addSubview:lineLabel];
    
    if (!attentionBtn)
    {
        attentionBtn = [[UIButton alloc] init];
    }
    attentionBtn.frame = CGRectMake(screenWidth-87, 12.5, 75, 35);
    attentionBtn.layer.cornerRadius = 17.5;
    attentionBtn.layer.masksToBounds = YES;
    attentionBtn.titleLabel.font = NormalFontWithSize(13);
    [attentionBtn setBackgroundImage:[UIImage imageNamed:@"未关注按钮"] forState:UIControlStateNormal];
    [attentionBtn setTitle:@"关注" forState:UIControlStateNormal];
    [attentionBtn setTitleColor:KPurpleColor forState:UIControlStateNormal];
    [attentionBtn addTarget:self action:@selector(attentionBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:attentionBtn];
    
    isSelect = NO;
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
    
    if ([self.delegate respondsToSelector:@selector(attentionIndex:)])
    {
        [self.delegate attentionIndex:sender.tag];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
