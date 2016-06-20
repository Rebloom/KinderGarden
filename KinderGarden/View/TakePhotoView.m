//
//  TakePhotoView.m
//  DrawMind
//
//  Created by Rebloom on 15/12/13.
//  Copyright (c) 2015年 Rebloom. All rights reserved.
//

#import "TakePhotoView.h"

#import "UIImage+UIColor.h"
#import "NSString+UIColor.h"

#define kTagTakePhotoBtnLayerCorner     1
#define kTagTakePhotoBtnBorderWidth     .7

@implementation TakePhotoView

@synthesize delegate;

@synthesize isShow;

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // init code
        [self loadView];
        self.hidden = YES;
    }
    
    return self;
}

- (void)loadView
{
    maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight-(277/2+50)-64)];
    maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.7];
    maskView.userInteractionEnabled = NO;
    maskView.hidden = YES;
    [self addSubview:maskView];
  
    containerView = [[UIView alloc] initWithFrame:CGRectMake(0, screenWidth, screenHeight, screenHeight-CGRectGetHeight(maskView.frame))];
    [self addSubview:containerView];
    
    // 如需定义更多类型视图 在此修改
    UIImageView * bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 277/2+50)];
    bgImage.backgroundColor = MY_COLOR(234, 234, 234, 1);
    [containerView addSubview:bgImage];
    
    UIButton * takePhoto = [[UIButton alloc] initWithFrame:CGRectMake(22.5, 28, screenWidth-45, 40)];
    [takePhoto setBackgroundImage:[[UIColor whiteColor] image] forState:UIControlStateNormal];
    takePhoto.tag = 1;
    [takePhoto setTitle:@"立即拍照" forState:UIControlStateNormal];
    [takePhoto setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [takePhoto addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];

    takePhoto.layer.cornerRadius = kTagTakePhotoBtnLayerCorner;
    takePhoto.layer.borderWidth = kTagTakePhotoBtnBorderWidth;
    takePhoto.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    takePhoto.layer.masksToBounds = YES;
    [containerView addSubview:takePhoto];
    
    UIButton * photoAlbum = [[UIButton alloc] initWithFrame:CGRectMake(22.5, CGRectGetMaxY(takePhoto.frame)+10, screenWidth-45, 40)];
    [photoAlbum setBackgroundImage:[[UIColor whiteColor] image] forState:UIControlStateNormal];
    photoAlbum.tag = 2;
    [photoAlbum setTitle:@"从本地相册里选择" forState:UIControlStateNormal];
    [photoAlbum setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [photoAlbum addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    photoAlbum.layer.cornerRadius = kTagTakePhotoBtnLayerCorner;
    photoAlbum.layer.masksToBounds = YES;
    photoAlbum.layer.borderWidth = kTagTakePhotoBtnBorderWidth;
    photoAlbum.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    [containerView addSubview:photoAlbum];
    
    UIButton * cancel = [[UIButton alloc] initWithFrame:CGRectMake(22.5, CGRectGetMaxY(photoAlbum.frame)+20, SCREEN_WIDTH-45, 40)];
    cancel.tag = 3;
    [cancel setBackgroundImage:[MY_COLOR(127, 127, 127, 1) image]forState:UIControlStateNormal];
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    cancel.layer.cornerRadius = kTagTakePhotoBtnLayerCorner;
    cancel.layer.masksToBounds = YES;
    cancel.layer.borderWidth = kTagTakePhotoBtnBorderWidth;
    cancel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    [containerView addSubview:cancel];
}

- (void)btnClicked:(id)sender
{
    UIButton * btn = (UIButton *)sender;
    
    [self takePhotoViewClickedAtIndex:btn.tag];
}

- (void)takePhotoViewClickedAtIndex:(NSInteger)index
{
    UIViewController * VC = (UIViewController *)self.delegate;
    
    if (index == 1)
    {
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            // 跳转到相机或相册页面
            imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = NO;
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            if (self.delegate)
            {
                [VC presentViewController:imagePicker animated:YES completion:^{}];
            }
        }
    }
    else if (index == 2)
    {
        CTAssetsPickerController * picker = [[CTAssetsPickerController alloc] init];
        picker.assetsFilter = [ALAssetsFilter allPhotos];
        picker.delegate = self;
        picker.assetsFilter = [ALAssetsFilter allPhotos];
        
        [VC presentViewController:picker animated:YES completion:NULL];
    }
    else
    {
        [self hide];
    }
}

- (void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets;
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectImages:)])
    {
        NSMutableArray * imageArray = [NSMutableArray array];
        for (int i = 0; i < assets.count; i++) {
            ALAsset * asset = assets[i];
            UIImage * tempImg = [UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
            NSData * imageData = UIImageJPEGRepresentation(tempImg,1.0);
            if (imageData != nil) {
                UIImage * image = [UIImage imageWithData:imageData];
                if (image != nil) {
                    [imageArray addObject:image];
                }
            }
        }
        UIViewController * VC = (UIViewController *)self.delegate;
        [VC dismissViewControllerAnimated:YES completion:nil];
        [self hide];
        [self.delegate didSelectImages:imageArray];
    }
}

- (BOOL)assetsPickerController:(CTAssetsPickerController *)picker shouldSelectAsset:(ALAsset *)asset
{
    // Allow 10 assets to be picked
    return (picker.selectedAssets.count < self.maxNumsOfSelect);
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (self.delegate)
    {
        UIViewController * VC = (UIViewController *)self.delegate;
        [VC dismissViewControllerAnimated:YES completion:nil];

    }
    // 上传头像立即显示所选图片
    UIImage *image = nil;
    
    if (_isEditPicture)
    {
        image = [info objectForKey:UIImagePickerControllerEditedImage];
    }
    else
    {
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    if ([self.delegate respondsToSelector:@selector(didSelectImage:)])
    {
        [self.delegate didSelectImage:image];
    }
    [self hide];
}

- (void)show
{
    self.hidden = NO;
    [self showWithAinimate:NO];
}

- (void)hide
{
    self.hidden = YES;
    [self hideWithAnimate:NO];
}

- (void)showWithAinimate:(BOOL)animate
{
    isShow = YES;
    maskView.hidden = NO;
    if (animate)
    {
        [UIView beginAnimations:@"Animation" context:nil];
        [UIView setAnimationDuration:.3];
        containerView.frame = CGRectMake(0, CGRectGetMaxY(maskView.frame), screenWidth, screenHeight-CGRectGetHeight(maskView.frame));
        [UIView commitAnimations];
    }
    else
    {
        containerView.frame = CGRectMake(0, CGRectGetMaxY(maskView.frame), screenWidth, screenHeight-CGRectGetHeight(maskView.frame));
    }
}

- (void)hideWithAnimate:(BOOL)animate
{
    isShow = NO;
    maskView.hidden = YES;
    if (animate)
    {
        [UIView beginAnimations:@"Animation" context:nil];
        [UIView setAnimationDuration:.3];
        containerView.frame = CGRectMake(0, screenHeight, screenWidth, screenHeight-CGRectGetHeight(maskView.frame));
        [UIView commitAnimations];
    }
    else
    {
        containerView.frame = CGRectMake(0, screenHeight, screenWidth, screenHeight-CGRectGetHeight(maskView.frame));
    }
}


@end
