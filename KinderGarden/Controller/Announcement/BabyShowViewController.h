//
//  BabyShowViewController.h
//  KinderGarden
//
//  Created by haonanchen on 16/6/11.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

#import "TakePhotoView.h"

#import "NXAddPictureView.h"


typedef void (^RefreshBlock)(BOOL refresh);

@interface BabyShowViewController : BasicViewController  <UITextFieldDelegate,UITextViewDelegate,NXAddPictureViewDelegate,TakePhotoViewDelegate,UIGestureRecognizerDelegate>
{
    UIScrollView * containerScrollView;
    
    UILabel * goodsDescLabel;
    
    UITextView * goodsDescTextView;
    
    NXAddPictureView * addPicView;
    
    TakePhotoView * takePhoto;
    
    UILabel * placeHolderLabel;
    
    UIButton * submitBtn;
}

@property (nonatomic, copy) NSString * shopID;

@property (nonatomic, copy) RefreshBlock refreshBlock;


@end

