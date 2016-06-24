//
//  EditDataCell.m
//  KinderGarden
//
//  Created by xdcy on 16/6/24.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "EditDataCell.h"
#import "NXMacro.h"
#import "NSString+UIColor.h"

@implementation EditDataCell

@synthesize nameLabel;
@synthesize rightLabel;
@synthesize lineLabel;
@synthesize rightImageView;
@synthesize photoImageView;

- (void)awakeFromNib
{
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
    if (!nameLabel)
    {
        nameLabel = [[UILabel alloc] init];
    }
    nameLabel.frame = CGRectMake(15, 0, screenWidth-20, 60);
    nameLabel.font = NormalFontWithSize(14);
    nameLabel.textColor = KBlackColor;
    nameLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:nameLabel];
    
    if (!rightLabel)
    {
        rightLabel = [[UILabel alloc] init];
    }
    rightLabel.frame = CGRectMake(screenWidth-200, 0, 170, 60);
    rightLabel.font = NormalFontWithSize(13);
    rightLabel.textColor = [UIColor lightGrayColor];
    rightLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:rightLabel];
    
    if (!rightImageView)
    {
        rightImageView = [[UIImageView alloc] init];
    }
    rightImageView.image = [UIImage imageNamed:@"right"];
    rightImageView.frame = CGRectMake(screenWidth - 20.5, 22.5, 8.5, 15);
    [self addSubview:rightImageView];
    
    if (!photoImageView)
    {
        photoImageView = [[UIImageView alloc] init];
    }
    photoImageView.frame = CGRectMake(screenWidth-80, 10, 40, 40);
    [self addSubview:photoImageView];
    
    if (!lineLabel)
    {
        lineLabel = [[UILabel alloc] init];
    }
    lineLabel.backgroundColor = KFontColorE;
    lineLabel.frame = CGRectMake(0, 59.5, screenWidth, 0.5);
    [self addSubview:lineLabel];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
