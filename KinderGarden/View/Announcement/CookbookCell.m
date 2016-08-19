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
    [picBtn addTarget:self action:@selector(picBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [editView addSubview:picBtn];
    
    if (!line)
    {
        line = [[UIView alloc] init];
    }
    line.frame = CGRectMake(0, CGRectGetMaxY(picBtn.frame),CGRectGetWidth(editView.frame), .5);
    line.backgroundColor = KFontColorE;
    [editView addSubview:line];

    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizerHandler:)];
    tap.cancelsTouchesInView = NO;
    tap.delegate = self;
    [editView addGestureRecognizer:tap];
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

- (void)gestureRecognizerHandler:(UIGestureRecognizer *)gesture
{
    UIView * recognizerView = gesture.view;
    if ([gesture isKindOfClass:[UITapGestureRecognizer class]])
    {
        // 点击了图片
        if (self.delegate && [self.delegate respondsToSelector:@selector(imageViewClickedAtIndex)])
        {
            [self.delegate imageViewClickedAtIndex];
        }
        [self bringSubviewToFront:recognizerView];
    }
}

@end
