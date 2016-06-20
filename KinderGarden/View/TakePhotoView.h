//
//  TakePhotoView.h
//  DrawMind
//
//  Created by Rebloom on 15/12/13.
//  Copyright (c) 2015年 Rebloom. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NXMacro.h"

#import "CTAssetsPickerController.h"

@protocol TakePhotoViewDelegate <NSObject>

@optional;
- (void)didSelectImage:(UIImage *)image;
- (void)didCancelSelect;
// 如果需要其他类型的参数 可以在这里再暴露方法出去

- (void)didSelectEditImage:(UIImage *)image;

- (void)didSelectImages:(NSArray *)assetImageArr;

- (void)didSelectMaxNum;

@end

@interface TakePhotoView : UIView <UIImagePickerControllerDelegate, UINavigationControllerDelegate,CTAssetsPickerControllerDelegate>
{
    BOOL isShow;
    
    UIImagePickerController * imagePicker;
    CTAssetsPickerController * groupPicker;
    
    UIView * containerView;
    UIView * maskView;
}

@property (nonatomic, assign) id <TakePhotoViewDelegate> delegate;

@property (nonatomic, assign) BOOL isShow;

@property (nonatomic, assign) BOOL isEditPicture;

@property (nonatomic, assign) BOOL isAssetPicker;

@property (nonatomic, assign) NSInteger maxNumsOfSelect;

- (void)hide;

- (void)show;


@end
