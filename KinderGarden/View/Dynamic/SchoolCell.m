//
//  SchoolCell.m
//  KinderGarden
//
//  Created by xdcy on 16/5/20.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "SchoolCell.h"
#import "NXMacro.h"
#import "NSString+UIColor.h"

@implementation SchoolCell
@synthesize bgView;
@synthesize photoImageView;
@synthesize newsImageView;
@synthesize shareImageView;
@synthesize lookImageView;
@synthesize commentImageView;
@synthesize nameLabel;
@synthesize timeLabel;
@synthesize titleLabel;
@synthesize contentLabel;
@synthesize lineLabel;
@synthesize lookLabel;
@synthesize commentLabel;
@synthesize shareBtn;
@synthesize delegate;
@synthesize lookBtn;
@synthesize commentBtn;

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
    if (!bgView)
    {
        bgView = [[UIImageView alloc] init];
    }
    bgView.backgroundColor = KFontColorA;
    bgView.layer.cornerRadius = 8;
    bgView.layer.masksToBounds = YES;
    bgView.userInteractionEnabled = YES;
    bgView.frame = CGRectMake(10, 10, screenWidth-20, 595);
    [self addSubview:bgView];

    if (!photoImageView)
    {
        photoImageView = [[UIImageView alloc] init];
    }
    photoImageView.frame = CGRectMake(10, 15, 40, 40);
    photoImageView.layer.cornerRadius = 20;
    photoImageView.layer.masksToBounds = YES;
    [bgView addSubview:photoImageView];
    
    if(!nameLabel)
    {
        nameLabel = [[UILabel alloc] init];
    }
    nameLabel.frame = CGRectMake(CGRectGetMaxX(photoImageView.frame)+5, CGRectGetMinY(photoImageView.frame)+3, 100, 20);
    nameLabel.font = MediumSTFontWithSize(17);
    nameLabel.textColor = KFontColorC;
    nameLabel.textAlignment = NSTextAlignmentLeft;
    [bgView addSubview:nameLabel];

    if(!timeLabel)
    {
        timeLabel = [[UILabel alloc] init];
    }
    timeLabel.frame = CGRectMake(CGRectGetMinX(nameLabel.frame), CGRectGetMaxY(nameLabel.frame)+5,100, 12);
    timeLabel.font = NormalFontWithSize(10);
    timeLabel.textColor = KFontColorB;
    timeLabel.textAlignment = NSTextAlignmentLeft;
    [bgView addSubview:timeLabel];

    if (!shareImageView)
    {
        shareImageView = [[UIImageView alloc] init];
    }
    shareImageView.image = [UIImage imageNamed:@"share.png"];
    shareImageView.backgroundColor = [UIColor blackColor];
    shareImageView.frame = CGRectMake(CGRectGetWidth(bgView.frame)-35, 20, 17, 24);
    [bgView addSubview:shareImageView];
    
    if (!shareBtn)
    {
        shareBtn = [[UIButton alloc] init];
    }
    shareBtn.frame = CGRectMake(CGRectGetWidth(bgView.frame)-50, 10, 40, 44);
    [shareBtn addTarget:self action:@selector(shareBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:shareBtn];
    
    if (!newsImageView)
    {
        newsImageView = [[UIImageView alloc] init];
    }
    newsImageView.frame = CGRectMake(0, 65, CGRectGetWidth(bgView.frame), 295);
    [bgView addSubview:newsImageView];
    
    if(!titleLabel)
    {
        titleLabel = [[UILabel alloc] init];
    }
    titleLabel.frame = CGRectMake(10, CGRectGetMaxY(newsImageView.frame)+25, CGRectGetWidth(bgView.frame)-20, 18);
    titleLabel.font = NormalFontWithSize(16);
    titleLabel.textColor = KFontColorC;
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [bgView addSubview:titleLabel];
    
    if(!contentLabel)
    {
        contentLabel = [[UILabel alloc] init];
    }
    contentLabel.frame = CGRectMake(CGRectGetMinX(titleLabel.frame), CGRectGetMaxY(titleLabel.frame)+15, CGRectGetWidth(titleLabel.frame), 60);
    contentLabel.font = NormalFontWithSize(12);
    contentLabel.textColor = KFontColorB;
    contentLabel.numberOfLines = 3;
    contentLabel.textAlignment = NSTextAlignmentLeft;
    [bgView addSubview:contentLabel];
    
    if (!lookImageView)
    {
        lookImageView = [[UIImageView alloc] init];
    }
    lookImageView.image = [UIImage imageNamed:@"read"];
    lookImageView.frame = CGRectMake(25, CGRectGetMaxY(contentLabel.frame)+13, 18, 14);
    [bgView addSubview:lookImageView];
    
    if (!lookLabel)
    {
        lookLabel = [[UILabel alloc] init];
    }
    lookLabel.frame = CGRectMake(50, CGRectGetMaxY(contentLabel.frame)+12, 55, 18);
    lookLabel.font = NormalFontWithSize(11);
    lookLabel.textColor = KFontColorB;
    lookLabel.textAlignment = NSTextAlignmentLeft;
    [bgView addSubview:lookLabel];
    
    if (!lookBtn)
    {
        lookBtn = [[UIButton alloc] init];
    }
    lookBtn.frame = CGRectMake(CGRectGetMinX(lookImageView.frame), CGRectGetMaxY(contentLabel.frame)+7, 70, 30);
    [lookBtn addTarget:self action:@selector(lookBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:lookBtn];
    
    if (!commentImageView)
    {
        commentImageView = [[UIImageView alloc] init];
    }
    commentImageView.image = [UIImage imageNamed:@"pinglun"];
    commentImageView.backgroundColor = [UIColor blackColor];
    commentImageView.frame = CGRectMake(100, CGRectGetMaxY(contentLabel.frame)+8, 21, 21);
    [bgView addSubview:commentImageView];
    
    if (!commentLabel)
    {
        commentLabel = [[UILabel alloc] init];
    }
    commentLabel.frame = CGRectMake(130, CGRectGetMinY(lookLabel.frame), 60, CGRectGetHeight(lookLabel.frame));
    commentLabel.font = NormalFontWithSize(11);
    commentLabel.textColor = KFontColorB;
    commentLabel.textAlignment = NSTextAlignmentLeft;
    [bgView addSubview:commentLabel];
    
    if (!commentBtn)
    {
        commentBtn = [[UIButton alloc] init];
    }
    commentBtn.frame = CGRectMake(CGRectGetMinX(commentImageView.frame), CGRectGetMaxY(contentLabel.frame)+7, 70, 30);
    [commentBtn addTarget:self action:@selector(commentBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:commentBtn];
    
    if (!lineLabel)
    {
        lineLabel = [[UILabel alloc] init];
    }
    lineLabel.frame = CGRectMake(0, 520, CGRectGetWidth(bgView.frame), 0.5);
    lineLabel.backgroundColor = KFontColorE;
    [bgView addSubview:lineLabel];
}

//分享
- (void)shareBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(shareWithIndex:)])
    {
        [self.delegate shareWithIndex:sender.tag];
    }
}

//总阅读量
- (void)lookBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(lookWithIndex:)])
    {
        [self.delegate lookWithIndex:sender.tag];
    }
}

//总转发量
- (void)commentBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(commentWithIndex:)])
    {
        [self.delegate commentWithIndex:sender.tag];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
