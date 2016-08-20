//
//  CookbookCell.m
//  KinderGarden
//
//  Created by xdcy on 16/8/16.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#define kTagImageViewGap            4
#define kTagImageViewBeginTag       1024

#import "CookbookCell.h"
#import "NXMacro.h"
#import "NSString+UIColor.h"

@implementation CookbookCell

@synthesize deleteBtn;
@synthesize MealTimeLabel;
@synthesize deleteImageView;
@synthesize addMealBtn;
@synthesize picBtn;
@synthesize editView;
@synthesize firstImageView;
@synthesize secondImageView;
@synthesize thirdImageView;
@synthesize fourthImageView;
@synthesize line;
@synthesize cookbookBtn;
@synthesize classNameLabel;
- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self createUI];
    }
    
    return self;
}

- (void)createUI
{
    self.backgroundColor = kBackgroundColor;

    if (!MealTimeLabel)
    {
        MealTimeLabel = [[UILabel alloc] init];
    }
    MealTimeLabel.frame = CGRectMake(0, 20, 70, 35);
    MealTimeLabel.textAlignment = NSTextAlignmentCenter;
    MealTimeLabel.textColor = KFontColorB;
    MealTimeLabel.backgroundColor = KFontColorA;
    MealTimeLabel.font = NormalFontWithSize(14);
    [self addSubview:MealTimeLabel];
    
    if (!deleteBtn)
    {
        deleteBtn = [[UIButton alloc] init];
    }
    deleteBtn.frame = CGRectMake(screenWidth-45, CGRectGetMinY(MealTimeLabel.frame), 40, 35);
    [deleteBtn addTarget:self action:@selector(deleteMealBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:deleteBtn];
    
    if (!deleteImageView)
    {
        deleteImageView = [[UIImageView alloc] init];
    }
    deleteImageView.image = [UIImage imageNamed:@"课程编辑删除"];
    deleteImageView.frame = CGRectMake(11, 8.5, 18, 18);
    [deleteBtn addSubview:deleteImageView];
    
    if (!addMealBtn)
    {
        addMealBtn = [[UIButton alloc] init];
    }
    addMealBtn.frame = CGRectMake((screenWidth-122)/2, 20, 122, 35);
    addMealBtn.backgroundColor = KFontColorA;
    addMealBtn.titleLabel.font = NormalFontWithSize(16);
    [addMealBtn setTitle:@"添加食谱" forState:UIControlStateNormal];
    [addMealBtn setTitleColor:KFontColorC forState:UIControlStateNormal];
    [addMealBtn addTarget:self action:@selector(addMealBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:addMealBtn];

    if (!editView)
    {
        editView = [[UIView alloc] init];
    }
    editView.frame = CGRectMake(90, 20, screenWidth-90-65, 100);
    editView.backgroundColor = KFontColorA;
    [self addSubview:editView];
    
    if (!picBtn)
    {
        picBtn = [[UIButton alloc] init];
    }
    picBtn.frame = CGRectMake(0, 0, CGRectGetWidth(editView.frame), 60);
    picBtn.backgroundColor = [UIColor clearColor];
    [picBtn setTitle:@"点此添加图片" forState:UIControlStateNormal];
    [picBtn setTitleColor:KFontColorB forState:UIControlStateNormal];
    [picBtn addTarget:self action:@selector(picBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [editView addSubview:picBtn];
    
    if (!cookbookBtn)
    {
        cookbookBtn = [[UIButton alloc] init];
    }
    cookbookBtn.titleLabel.font = NormalFontWithSize(14);
    cookbookBtn.backgroundColor = KFontColorA;
    [cookbookBtn setTitle:@"输入菜谱" forState:UIControlStateNormal];
    [cookbookBtn setTitleColor:KFontColorB forState:UIControlStateNormal];
    cookbookBtn.frame = CGRectMake(CGRectGetMinX(picBtn.frame), CGRectGetMaxY(picBtn.frame), CGRectGetWidth(picBtn.frame), 40);
    [cookbookBtn addTarget:self action:@selector(cookbookBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [editView addSubview:cookbookBtn];
    
    if (!classNameLabel)
    {
        classNameLabel = [[UILabel alloc] init];
    }
    classNameLabel.frame = CGRectMake(0, 0, CGRectGetWidth(cookbookBtn.frame), CGRectGetHeight(cookbookBtn.frame));
    classNameLabel.textAlignment = NSTextAlignmentLeft;
    classNameLabel.textColor = KFontColorC;
    classNameLabel.backgroundColor = [UIColor clearColor];
    classNameLabel.font = NormalFontWithSize(14);
    [cookbookBtn addSubview:classNameLabel];
    
    if (!firstImageView)
    {
        firstImageView = [[UIImageView alloc] init];
    }
    [editView addSubview:firstImageView];
    
    if (!secondImageView)
    {
        secondImageView = [[UIImageView alloc] init];
    }
    [editView addSubview:secondImageView];
    
    if (!thirdImageView)
    {
        thirdImageView = [[UIImageView alloc] init];
    }
    [editView addSubview:thirdImageView];
    
    if (!fourthImageView)
    {
        fourthImageView = [[UIImageView alloc] init];
    }
    [editView addSubview:fourthImageView];

    if (iPhone6Plus)
    {
        firstImageView.frame = CGRectMake(5, 5, 50, 50);
        secondImageView.frame = CGRectMake(70, 5, 50, 50);
        thirdImageView.frame = CGRectMake(135, 5, 50, 50);
        fourthImageView.frame = CGRectMake(200, 5, 50, 50);
    }
    else
    {
        firstImageView.frame = CGRectMake(0, 5, 50, 50);
        secondImageView.frame = CGRectMake(55, 5, 50, 50);
        thirdImageView.frame = CGRectMake(110, 5, 50, 50);
        fourthImageView.frame = CGRectMake(165, 5, 50, 50);
    }
    
    if (iPhone5||iPhone4s)
    {
        fourthImageView.hidden = YES;
    }
    else
    {
        fourthImageView.hidden = NO;
    }
    
    if (!line)
    {
        line = [[UILabel alloc] init];
    }
    line.frame = CGRectMake(0, CGRectGetMaxY(picBtn.frame),CGRectGetWidth(editView.frame), .5);
    line.backgroundColor = KFontColorE;
    [editView addSubview:line];
}

//选择图片
- (void)picBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(picBtnWithIndex:)])
    {
        [self.delegate picBtnWithIndex:sender.tag];
    }
}

//添加食谱
- (void)addMealBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(addMealWithIndex:)])
    {
        [self.delegate addMealWithIndex:sender.tag];
    }
}

//删除食谱
- (void)deleteMealBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(deleteMealWithIndex:)])
    {
        [self.delegate deleteMealWithIndex:sender];
    }
}

//编辑菜谱
- (void)cookbookBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(cookbookWithIndex:)])
    {
        [self.delegate cookbookWithIndex:sender.tag];
    }
}


@end
