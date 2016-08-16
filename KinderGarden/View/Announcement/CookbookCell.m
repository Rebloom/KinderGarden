//
//  CookbookCell.m
//  KinderGarden
//
//  Created by xdcy on 16/8/16.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "CookbookCell.h"
#import "NXMacro.h"
#import "NSString+UIColor.h"

@implementation CookbookCell
@synthesize containerScrollView;
@synthesize deleteBtn;
@synthesize MealTimeLabel;
@synthesize deleteImageView;
@synthesize addMealBtn;
@synthesize addPicView;

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
    
    if (!containerScrollView)
    {
        containerScrollView = [[UIScrollView alloc] init];
    }
    containerScrollView .frame = CGRectMake(90, 20, screenWidth-90-45, 90);
    containerScrollView.backgroundColor = KFontColorA;
    containerScrollView.showsVerticalScrollIndicator = NO;
    containerScrollView.scrollEnabled = NO;
    containerScrollView.showsHorizontalScrollIndicator = NO;
    CGFloat addtionalHeight = 200;
    containerScrollView.contentSize = CGSizeMake(screenWidth, screenHeight+addtionalHeight);
    [self addSubview:containerScrollView];
    
    if (!addPicView) {
        addPicView = [[NXAddPictureView alloc] init];
    }
    addPicView.frame = CGRectMake(0,0, CGRectGetWidth(containerScrollView.frame), 30);
    addPicView.delegate = self;
    [addPicView.imageArray removeAllObjects];
    [addPicView.imageArray addObject:[UIImage imageNamed:@"icon_takePicture"]];
    [addPicView reloadPictureViewWithImages];
    [containerScrollView addSubview:addPicView];
    
    if (!line)
    {
        line = [[UIView alloc] init];
    }
    line.frame = CGRectMake(0, CGRectGetMaxY(addPicView.frame), screenWidth, .5);
    line.backgroundColor = [UIColor lightGrayColor];
    [containerScrollView addSubview:line];
    
    if (!takePhoto)
    {
        takePhoto = [[TakePhotoView alloc] init];
    }
    takePhoto.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    takePhoto.delegate = self;
    [self addSubview:takePhoto];
    [[UIApplication sharedApplication].keyWindow addSubview:takePhoto];

    
    if (!deleteBtn)
    {
        deleteBtn = [[UIButton alloc] init];
    }
    deleteBtn.frame = CGRectMake(screenWidth-45, CGRectGetMinY(containerScrollView.frame), 40, 35);
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

}

//添加课程
- (void)addMealBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(addMealWithIndex:)])
    {
        [self.delegate addMealWithIndex:sender.tag];
    }
}

//删除课程
- (void)deleteMealBtnOnClick:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(deleteMealWithIndex:)])
    {
        [self.delegate deleteMealWithIndex:sender];
    }
}


-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    NSString * touchObject = NSStringFromClass([touch.view class]);
    
    // 点击的是Button控件
    if([touchObject isEqualToString:@"UIButton"])
    {
        return NO;
    }
    return YES;
}

#pragma BrowseDelegate
- (void)deleteImageAtIndex:(NSInteger)index
{
    if (index < addPicView.imageArray.count-1)
    {
        [addPicView.imageArray removeObjectAtIndex:index];
        [addPicView reloadPictureViewWithImages];
    }
}

- (NSInteger)currentNumberOfPictures
{
    return addPicView.imageArray.count-1;
}

#pragma TakePhotoViewDelegate
- (void)didSelectImage:(UIImage *)image
{
    [addPicView.imageArray insertObject:image atIndex:addPicView.imageArray.count-1];
    [addPicView reloadPictureViewWithImages];
    
    //    submitBtn.frame = CGRectMake(80, CGRectGetMaxY(addPicView.frame)+20, screenWidth-160, 45);
}

- (void)didSelectImages:(NSArray *)assetImageArr
{
    for (UIImage * image in assetImageArr)
    {
        [addPicView.imageArray insertObject:image atIndex:addPicView.imageArray.count-1];
    }
    [addPicView reloadPictureViewWithImages];
    //    submitBtn.frame = CGRectMake(80, CGRectGetMaxY(addPicView.frame)+20, screenWidth-160, 45);
    
    [takePhoto hide];
}

- (void)didSelectMaxNum
{
//    [self showAlertWithMessage:@"最多添加4张图片"];
}

#pragma ImageViewDelegate
- (void)imageViewClickedAtIndex:(NSInteger)index
{
    if (index == addPicView.imageArray.count-1)
    {
        if (addPicView.imageArray.count == 16)
        {
//            [self showAlertWithMessage:@"最多添加4张图片"];
        }
        else
        {
            // resignFirstResponder
//            [self viewTapped:nil];
            [takePhoto show];
            takePhoto.maxNumsOfSelect = 16-addPicView.imageArray.count;
        }
    }
}

- (void)imageViewDeleteAtIndex:(NSInteger)index
{
    if (index < addPicView.imageArray.count-1)
    {
        [addPicView.imageArray removeObjectAtIndex:index];
        [addPicView reloadPictureViewWithImages];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
