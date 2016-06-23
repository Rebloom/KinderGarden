//
//  Parentm
//  KinderGarden
//
//  Created by xdcy on 16/6/23.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "ParentCell.h"
#import "NXMacro.h"
#import "NSString+UIColor.h"

@implementation ParentCell
@synthesize bgView;
@synthesize photoImageView;
@synthesize picImageView;
@synthesize timeLabel;
@synthesize nameLabel;
@synthesize contentLabel;
@synthesize pinglunImageView;
@synthesize pinglunLabel;
@synthesize pinglunBtn;
@synthesize zanImageView;
@synthesize zanLabel;
@synthesize zanBtn;
- (void)awakeFromNib {
    // Initialization code
}




- (void)createUI
{
    if (!bgView)
    {
        bgView = [[UIView alloc] init];
    }
    bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bgView];
    
    if (!photoImageView)
    {
        photoImageView = [[UIImageView alloc] init];
    }
    photoImageView.layer.cornerRadius = 15;
    photoImageView.layer.masksToBounds = YES;
    [bgView addSubview:photoImageView];
    
    if (!nameLabel)
    {
        nameLabel = [[UILabel alloc] init];
    }
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont systemFontOfSize:12];
    [bgView addSubview:nameLabel];
    
    if (!timeLabel)
    {
        timeLabel = [[UILabel alloc] init];
    }
    timeLabel.textAlignment = NSTextAlignmentLeft;
    timeLabel.textColor = [UIColor lightGrayColor];
    timeLabel.font = [UIFont systemFontOfSize:10];
    [bgView addSubview:timeLabel];
    
    if (!picImageView)
    {
        picImageView = [[UIImageView alloc] init];
    }
    [bgView addSubview:picImageView];
    
    if (!contentLabel)
    {
        contentLabel = [[UILabel alloc] init];
    }
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.textColor = [UIColor blackColor];
    contentLabel.font = [UIFont systemFontOfSize:12];
    contentLabel.numberOfLines = 2;
    [bgView addSubview:contentLabel];
    
    if (!pinglunBtn)
    {
        pinglunBtn = [[UIButton alloc] init];
    }
    [pinglunBtn addTarget:self action:@selector(pinglunBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:pinglunBtn];
    
    if (!pinglunImageView)
    {
        pinglunImageView = [[UIImageView alloc] init];
    }
    pinglunImageView.image = [UIImage imageNamed:@"评论"];
    [pinglunBtn addSubview:pinglunImageView];

    if (!pinglunLabel)
    {
        pinglunLabel = [[UILabel alloc] init];
    }
    pinglunLabel.textAlignment = NSTextAlignmentLeft;
    pinglunLabel.textColor = KFontColorB;
    pinglunLabel.font = NormalFontWithSize(10);
    [pinglunBtn addSubview:pinglunLabel];
    
    if (!zanBtn)
    {
        zanBtn = [[UIButton alloc] init];
    }
    [zanBtn addTarget:self action:@selector(zanBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:zanBtn];
    
    if (!zanImageView)
    {
        zanImageView = [[UIImageView alloc] init];
    }
    zanImageView.image = [UIImage imageNamed:@"点赞"];
    [zanBtn addSubview:zanImageView];
    
    if (!zanLabel)
    {
        zanLabel = [[UILabel alloc] init];
    }
    zanLabel.textAlignment = NSTextAlignmentLeft;
    zanLabel.textColor = KFontColorB;
    zanLabel.font = NormalFontWithSize(10);
    [zanBtn addSubview:zanLabel];
    
    bgView.frame = CGRectMake(0,0,(screenWidth-30)/2, 290);
    photoImageView.frame = CGRectMake(10, 10, 30, 30);
    nameLabel.frame = CGRectMake(CGRectGetMaxX(photoImageView.frame)+10, 10, 100, 15);
    timeLabel.frame = CGRectMake(CGRectGetMinX(nameLabel.frame), CGRectGetMaxY(nameLabel.frame), 100, 15);
    picImageView.frame = CGRectMake(0, CGRectGetMaxY(photoImageView.frame)+5, (screenWidth-30)/2, 170);
    contentLabel.frame = CGRectMake(20, CGRectGetMaxY(picImageView.frame)+10, (screenWidth-30)/2-40, 40);
    contentLabel.frame = CGRectMake(20, CGRectGetMaxY(picImageView.frame)+10, (screenWidth-30)/2-40, 40);
    pinglunBtn.frame = CGRectMake(20, CGRectGetMaxY(contentLabel.frame)-5, 70, 30);
    pinglunImageView.frame = CGRectMake(0, 8.5, 13, 13);
    pinglunLabel.frame = CGRectMake(CGRectGetMaxX(pinglunImageView.frame)+5, 0, 50, 30);
    zanBtn.frame = CGRectMake(CGRectGetMaxX(pinglunBtn.frame)+5, CGRectGetMaxY(contentLabel.frame)-5, 70, 30);
    zanImageView.frame = CGRectMake(15, 9, 14, 13);
    zanLabel.frame = CGRectMake(CGRectGetMaxX(zanImageView.frame)+5, 0, 50, 30);
}

- (void)pinglunBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(pinglunIndex:)])
    {
        [self.delegate pinglunIndex:sender.tag];
    }
}

- (void)zanBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(zanIndex:)])
    {
        [self.delegate zanIndex:sender.tag];
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
@end
