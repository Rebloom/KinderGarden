//
//  SelectClassCell.m
//  KinderGarden
//
//  Created by xdcy on 16/8/15.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "SelectClassCell.h"
#import "NXMacro.h"
#import "NSString+UIColor.h"

@implementation SelectClassCell
@synthesize selectImageView;
@synthesize classLabel;

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
    if (!classLabel)
    {
        classLabel = [[UILabel alloc] init];
    }
    
    classLabel.textAlignment = NSTextAlignmentLeft;
    classLabel.textColor = KFontColorC;
    classLabel.font = MediumSTFontWithSize(13);
    [self addSubview:classLabel];
    
    if (!selectImageView)
    {
        selectImageView = [[UIImageView alloc] init];
    }
    selectImageView.image = [UIImage imageNamed:@"班级未选中"];
    [self addSubview:selectImageView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
