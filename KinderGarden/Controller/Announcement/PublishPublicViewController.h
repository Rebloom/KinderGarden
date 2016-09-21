//
//  PublishPublicViewController.h
//  KinderGarden
//
//  Created by haonanchen on 16/8/20.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

#import "TakePhotoView.h"

#import "NXAddPictureView.h"

#import "QiniuSDK.h"

#import "PublicRequest.h"

#import "NXUploadFileManager.h"

typedef void (^RefreshBlock)(BOOL refresh);

@interface PublishPublicViewController : BasicViewController  <UITextFieldDelegate,UITextViewDelegate,NXAddPictureViewDelegate,TakePhotoViewDelegate,UIGestureRecognizerDelegate,UploadFileDelegate>
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
