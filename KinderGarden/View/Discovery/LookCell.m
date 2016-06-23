//
//  LookCell.m
//  KinderGarden
//
//  Created by xdcy on 16/6/23.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "LookCell.h"
#import "NXMacro.h"
#import "NSString+UIColor.h"
#import "UIImage+UIColor.h"

@implementation LookCell
@synthesize photoImageView;
@synthesize nameLabel;
@synthesize timeLabel;
@synthesize moreBtn;
@synthesize lineLabel;
@synthesize moreImageView;

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
    
    if (!moreImageView)
    {
        moreImageView = [[UIImageView alloc] init];
    }
    moreImageView.image = [UIImage imageNamed:@"个人更多"];
    moreImageView.frame = CGRectMake(screenWidth-34, 27.5, 22, 5);
    [self addSubview:moreImageView];
    
    if (!moreBtn)
    {
        moreBtn = [[UIButton alloc] init];
    }
    moreBtn.frame = CGRectMake(screenWidth-40, 0, 40, 60);
    [moreBtn addTarget:self action:@selector(moreBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:moreBtn];
}

- (void)moreBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(lookIndex:)])
    {
        [self.delegate lookIndex:sender.tag];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
