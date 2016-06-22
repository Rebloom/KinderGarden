//
//  AddTeatcherCell.m
//  KinderGarden
//
//  Created by xdcy on 16/6/12.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "AddTeatcherCell.h"
#import "NXMacro.h"
#import "NSString+UIColor.h"

@implementation AddTeatcherCell
@synthesize photoImageView;
@synthesize selectImageView;
@synthesize nameLabel;

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
    if(!photoImageView)
    {
        photoImageView= [[UIImageView alloc] init];
    }
    photoImageView.image = [UIImage imageNamed:@"backImage.jpg"];
    photoImageView.frame = CGRectMake(10, 10, 40, 40);
    photoImageView.layer.cornerRadius = 40/2;
    photoImageView.layer.masksToBounds = YES;
    [self addSubview:photoImageView];
    
    
    
    if(!nameLabel)
    {
        nameLabel= [[UILabel alloc] init];
    }
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = KFontColorC;
    nameLabel.frame = CGRectMake(60, 0, 200, 60);
    nameLabel.font = NormalFontWithSize(16);
    [self addSubview:nameLabel];
    
    if (!selectImageView)
    {
        selectImageView = [[UIImageView alloc] init];
    }

    [self addSubview:selectImageView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
