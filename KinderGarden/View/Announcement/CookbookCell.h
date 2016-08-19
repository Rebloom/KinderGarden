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

- (void)imageViewClickedAtIndex;

@end

@interface CookbookCell : UITableViewCell<UITextFieldDelegate,UIGestureRecognizerDelegate>
{
    UIView * line;
    UIButton * picBtn;
    UIView * editView;
}
@property(nonatomic,strong) UILabel * MealTimeLabel;
@property(nonatomic,strong) UIButton * deleteBtn;
@property(nonatomic,strong) UIButton * addMealBtn;
@property(nonatomic,strong) UIImageView * deleteImageView;
@property(nonatomic,strong) UIButton * picBtn;
@property(nonatomic,strong) UIView * editView;

@property(nonatomic,assign) id<CookbookDelegate>delegate;

@end
