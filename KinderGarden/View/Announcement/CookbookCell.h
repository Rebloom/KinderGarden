//
//  CookbookCell.h
//  KinderGarden
//
//  Created by xdcy on 16/8/16.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TakePhotoView.h"
#import "NXAddPictureView.h"

typedef void (^RefreshBlock)(BOOL refresh);

@protocol CookbookDelegate <NSObject>

- (void)deleteMealWithIndex:(UIButton*)sender;
- (void)addMealWithIndex:(NSInteger)index;

@end

@interface CookbookCell : UITableViewCell<UITextFieldDelegate,UITextViewDelegate,NXAddPictureViewDelegate,TakePhotoViewDelegate,UIGestureRecognizerDelegate>
{
    TakePhotoView * takePhoto;
    UIView * line;
}
@property(nonatomic,strong) UILabel * MealTimeLabel;
@property(nonatomic,strong) UIButton * deleteBtn;
@property(nonatomic,strong) UIScrollView * containerScrollView;
@property(nonatomic,strong) UIButton * addMealBtn;
@property(nonatomic,strong) UIImageView * deleteImageView;
@property(nonatomic,strong) NXAddPictureView * addPicView;
@property(nonatomic, copy) NSString * shopID;
@property(nonatomic, copy) RefreshBlock refreshBlock;

@property(nonatomic,assign) id<CookbookDelegate>delegate;

@end
