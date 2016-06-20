//
//  FifthCell.m
//  KinderGarden
//
//  Created by 孤星之殇 on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "FifthCell.h"
#import "NXMacro.h"
#import "NSString+UIColor.h"

@implementation FifthCell
@synthesize nameLabel;
@synthesize rightLabel;
@synthesize rightImageView;

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
    nameLabel.frame = CGRectMake(15, 0, screenWidth-20, 45);
    nameLabel.font = NormalFontWithSize(14);
    nameLabel.textColor = KBlackColor;
    nameLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:nameLabel];
    
    if (!rightLabel)
    {
        rightLabel = [[UILabel alloc] init];
    }
    rightLabel.frame = CGRectMake(screenWidth-150, 0, 140, 45);
    rightLabel.font = NormalFontWithSize(13);
    rightLabel.textColor = [UIColor lightGrayColor];
    rightLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:rightLabel];

    if (!rightImageView)
    {
        rightImageView = [[UIImageView alloc] init];
    }
    rightImageView.image = [UIImage imageNamed:@"right"];
    rightImageView.frame = CGRectMake(screenWidth - 20.5, 15, 8.5, 15);
    [self addSubview:rightImageView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
