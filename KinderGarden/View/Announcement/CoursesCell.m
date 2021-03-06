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
@synthesize deleteImageView;

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
    editClassBtn.backgroundColor = [UIColor clearColor];
    editClassBtn.frame = CGRectMake(CGRectGetMaxX(numLabel.frame)+20, 25, screenWidth-90-65, 35);
    [editClassBtn addTarget:self action:@selector(editClassBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:editClassBtn];

   
    if (!classNameLabel)
    {
        classNameLabel = [[UILabel alloc] init];
    }
    classNameLabel.frame = CGRectMake(0, 0, CGRectGetWidth(editClassBtn.frame), CGRectGetHeight(editClassBtn.frame));
    classNameLabel.textAlignment = NSTextAlignmentLeft;
    classNameLabel.textColor = KFontColorC;
    classNameLabel.backgroundColor = KFontColorA;
    classNameLabel.font = NormalFontWithSize(14);
    [editClassBtn addSubview:classNameLabel];
    
    if (!deleteBtn)
    {
        deleteBtn = [[UIButton alloc] init];
    }
    deleteBtn.frame = CGRectMake(screenWidth-45, CGRectGetMinY(editClassBtn.frame), 40, 35);
    [deleteBtn addTarget:self action:@selector(deleteBtnOnClick:WithSection:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:deleteBtn];
   
    if (!deleteImageView)
    {
        deleteImageView = [[UIImageView alloc] init];
    }
    deleteImageView.image = [UIImage imageNamed:@"课程编辑删除"];
    deleteImageView.frame = CGRectMake(11, 8.5, 18, 18);
    [deleteBtn addSubview:deleteImageView];
    
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

//添加课程
- (void)addClassBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(addClassWithIndex:)])
    {
        [self.delegate addClassWithIndex:sender.tag];
    }
}

//删除课程
- (void)deleteBtnOnClick:(UIButton*)sender WithSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(deleteWithIndex:WithSection:)])
    {
        [self.delegate deleteWithIndex:sender WithSection:self.section];
    }
}

//编辑课程
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
