//
//  ArticleDetailCell.m
//  KinderGarden
//
//  Created by xdcy on 16/6/27.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "ArticleDetailCell.h"
#import "NSString+UIColor.h"
#import "NXMacro.h"

@implementation ArticleDetailCell
@synthesize photoImageView;
@synthesize nameLabel;
@synthesize timeLabel;
@synthesize contentLabel;
@synthesize lineLabel;
@synthesize zanImageView;
@synthesize zanBtn;

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
    photoImageView.image = [UIImage imageNamed:@"beauty3.jpg"];
    photoImageView.layer.masksToBounds = YES;
    photoImageView.layer.cornerRadius = 20;
    photoImageView.frame = CGRectMake(20, 30, 40, 40);
    [self addSubview:photoImageView];
    
    if(!nameLabel)
    {
        nameLabel = [[UILabel alloc] init];
    }
    nameLabel.frame = CGRectMake(CGRectGetMaxX(photoImageView.frame)+10, 15, 150, 20);
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = KFontColorC;
    nameLabel.text = @"妞妞妈妈";
    nameLabel.font = NormalFontWithSize(15);
    [self addSubview:nameLabel];
    
    if(!timeLabel)
    {
        timeLabel = [[UILabel alloc] init];
    }
    timeLabel.frame = CGRectMake(CGRectGetMaxX(photoImageView.frame)+10, 35, 150, 15);
    timeLabel.textAlignment = NSTextAlignmentLeft;
    timeLabel.textColor = KFontColorB;
    timeLabel.text = @"4小时前";
    timeLabel.font = NormalFontWithSize(11);
    [self addSubview:timeLabel];
    
    if (!zanBtn)
    {
        zanBtn = [[UIButton alloc] init];
    }
    zanBtn.frame = CGRectMake(screenWidth-60, 15, 60, 35);
    zanBtn.backgroundColor = [UIColor clearColor];
    [zanBtn addTarget:self action:@selector(zanBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:zanBtn];
  
    if (!zanImageView)
    {
        zanImageView = [[UIImageView alloc] init];
    }
    zanImageView.image = [UIImage imageNamed:@"点赞"];
    zanImageView.frame = CGRectMake(20, 10, 15, 14);
    [zanBtn addSubview:zanImageView];
    
    if(!contentLabel)
    {
        contentLabel = [[UILabel alloc] init];
    }
    contentLabel.frame = CGRectMake(CGRectGetMinX(timeLabel.frame), CGRectGetMaxY(timeLabel.frame), screenWidth-CGRectGetMinX(timeLabel.frame)-10, 60);
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.textColor = KFontColorB;
    contentLabel.text = @"青山绿水是苦丁茶的一种——小叶苦丁。清凉降火的效果明显，没有大叶苦丁那种强烈的苦涩味，又有绿茶的清甜。冲泡之后色泽碧绿，小叶苦丁茶俗称“青山绿水”，是本犀科女贞属乔木植物";
    contentLabel.numberOfLines = 0;
    contentLabel.font = NormalFontWithSize(13);
    [self addSubview:contentLabel];
    
    if (!lineLabel)
    {
        lineLabel = [[UILabel alloc] init];
    }
    lineLabel.backgroundColor = KFontColorE;
    lineLabel.frame = CGRectMake(50, 124.5, screenWidth-55, 0.5);
    [self addSubview:lineLabel];
}

- (void)zanBtnOnClick:(UIButton*)sender
{

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
