//
//  CookbookCell.h
//  KinderGarden
//
//  Created by xdcy on 16/8/16.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CookbookDelegate <NSObject>

- (void)deleteMealWithIndex:(UIButton*)sender;

- (void)addMealWithIndex:(NSInteger)index;

- (void)picBtnWithIndex:(NSInteger)index;

@end

@interface CookbookCell : UITableViewCell<UITextFieldDelegate,UIGestureRecognizerDelegate>

@property(nonatomic,strong) UILabel * MealTimeLabel;
@property(nonatomic,strong) UIButton * deleteBtn;
@property(nonatomic,strong) UIButton * addMealBtn;
@property(nonatomic,strong) UIImageView * deleteImageView;
@property(nonatomic,strong) UIButton * picBtn;
@property(nonatomic,strong) UIView * editView;
@property(nonatomic,strong) UIImageView * firstImageView;
@property(nonatomic,strong) UIImageView * secondImageView;
@property(nonatomic,strong) UIImageView * thirdImageView;
@property(nonatomic,strong) UIImageView * fourthImageView;
@property(nonatomic,strong) UIView * line;
@property(nonatomic,assign) id<CookbookDelegate>delegate;

@end
