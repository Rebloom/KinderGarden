//
//  CoursesCell.m
//  KinderGarden
//
//  Created by 孤星之殇 on 16/7/3.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "CoursesCell.h"
#import "NXMacro.h"
#import "NSString+UIColor.h"
#import "UIImage+UIColor.h"

@implementation CoursesCell
@synthesize numLabel;
@synthesize classNameLabel;
@synthesize deleteBtn;
@synthesize addClassBtn;
@synthesize section;
@synthesize editClassBtn;

- (void)awakeFromNib {
    [super awakeFromNib];
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
    self.backgroundColor = kBackgroundColor;
    
    if (!numLabel)
    {
        numLabel = [[UILabel alloc] init];
    }
    numLabel.frame = CGRectMake(12, 25, 60, 35);
    numLabel.textAlignment = NSTextAlignmentCenter;
    numLabel.textColor = KFontColorB;
    numLabel.backgroundColor = KFontColorA;
    numLabel.font = NormalFontWithSize(14);
    [self addSubview:numLabel];
    
    if (!editClassBtn)
    {
        editClassBtn = [[UIButton alloc] init];
    }
    editClassBtn.backgroundColor = [UIColor redColor];
    editClassBtn.frame = CGRectMake(CGRectGetMaxX(numLabel.frame)+20, 25, 210, 35);
    [editClassBtn addTarget:self action:@selector(editClassBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:editClassBtn];

    
    if (!classNameLabel)
    {
        classNameLabel = [[UILabel alloc] init];
    }
    classNameLabel.frame = CGRectMake(0, 0, 210, 35);
    classNameLabel.textAlignment = NSTextAlignmentLeft;
    classNameLabel.textColor = KFontColorC;
    classNameLabel.backgroundColor = KFontColorA;
    classNameLabel.font = NormalFontWithSize(14);
    [editClassBtn addSubview:classNameLabel];
    
    if (!deleteBtn)
    {
        deleteBtn = [[UIButton alloc] init];
    }
    deleteBtn.backgroundColor = [UIColor redColor];
    deleteBtn.frame = CGRectMake(CGRectGetMaxX(editClassBtn.frame)+30, CGRectGetMinY(editClassBtn.frame), 40, 35);
    [deleteBtn addTarget:self action:@selector(deleteBtnOnClick:WithSection:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:deleteBtn];
    
    if (!addClassBtn)
    {
        addClassBtn = [[UIButton alloc] init];
    }
    addClassBtn.frame = CGRectMake((screenWidth-122)/2, 20, 122, 35);
    addClassBtn.backgroundColor = KFontColorA;
    addClassBtn.titleLabel.font = NormalFontWithSize(16);
    [addClassBtn setTitle:@"添加课程" forState:UIControlStateNormal];
    [addClassBtn setTitleColor:KFontColorC forState:UIControlStateNormal];
    [addClassBtn addTarget:self action:@selector(addClassBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:addClassBtn];
}

- (void)addClassBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(addClassWithIndex:)])
    {
        [self.delegate addClassWithIndex:sender.tag];
    }
}

- (void)deleteBtnOnClick:(UIButton*)sender WithSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(deleteWithIndex:WithSection:)])
    {
        [self.delegate deleteWithIndex:sender WithSection:self.section];
    }
}

- (void)editClassBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(editClassWithIndex:WithSection:)])
    {
        [self.delegate editClassWithIndex:sender WithSection:self.section];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
