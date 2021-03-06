//
//  AccoutInfoViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "AccoutInfoViewController.h"
#import <Accelerate/Accelerate.h>
#import "FifthCell.h"
#import "AccoutSafeViewController.h"

@implementation AccoutInfoViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.view.backgroundColor = KFontColorA;
    
    [headerView setBackgroundColor:[UIColor clearColor]];
    [headerView setStatusBarColor:[UIColor clearColor]];
    [self.view bringSubviewToFront:headerView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [headerView loadComponentsWithTitle:@"账号信息" withTitleColor:KFontColorA];
    [headerView backButton];

    [self createTableView];
    [self createUI];
}
- (void)createTableView
{
    infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, screenWidth, screenHeight) style:UITableViewStylePlain];
    infoTableView.delegate = self;
    infoTableView.dataSource = self;
    infoTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:infoTableView];
    
    if (!headView)
    {
        headView = [[UIImageView alloc] init];
    }
    headView.userInteractionEnabled = YES;
    headView.frame = CGRectMake(0, 0, screenWidth, 170);
    CGRect rect1 = CGRectMake(0, 0, screenWidth, 170);
    UIImage * image2 = [UIImage imageWithCGImage:CGImageCreateWithImageInRect([[UIImage imageNamed:@"backImage.jpg"] CGImage], rect1)];
    headView.image = [self blurryImage:image2 withBlurLevel:0.2];
    infoTableView.tableHeaderView = headView;
    
    UIView * footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 0.5)];
    footView.backgroundColor = KFontColorE;
    infoTableView.tableFooterView = footView;
}

-(void)createUI
{
    if (!iconView)
    {
        iconView = [[UIImageView alloc] init];
    }
    iconView.frame = CGRectMake(9, 70, 75, 75);
    iconView.image = [UIImage imageNamed:@"backImage.jpg"];
    iconView.layer.cornerRadius = 37.5;
    iconView.layer.masksToBounds = YES;
    [headView addSubview:iconView];
    
    if (!photoBtn)
    {
        photoBtn = [[UIButton alloc]init];
    }
    photoBtn.backgroundColor = [UIColor clearColor];
    photoBtn.frame = CGRectMake(9, 70, 75, 75);
    [photoBtn addTarget:self action:@selector(photoBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:photoBtn];
    
    if (!nameLabel)
    {
        nameLabel = [[UILabel alloc] init];
    }
    nameLabel.font = NormalFontWithSize(16);
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.frame = CGRectMake(CGRectGetMaxX(iconView.frame)+6, CGRectGetMinY(iconView.frame)+15, 180, 25);
    nameLabel.textColor = KFontColorA;
    nameLabel.text = @"娇娇老师";
    [headView addSubview:nameLabel];
    
    if (!phoneLabel)
    {
        phoneLabel = [[UILabel alloc] init];
    }
    phoneLabel.font = NormalFontWithSize(13);
    phoneLabel.textAlignment = NSTextAlignmentLeft;
    phoneLabel.frame = CGRectMake(CGRectGetMaxX(iconView.frame)+6, CGRectGetMaxY(nameLabel.frame), 180, 20);
    phoneLabel.textColor = KFontColorA;
    phoneLabel.text = @"手机号：15112345678";
    [headView addSubview:phoneLabel];
}

- (void)photoBtnOnClick:(UIButton*)sender
{
    [self takePhoto];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    
    FifthCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[FifthCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSArray * titleArr = @[@"昵称",@"姓名",@"性别",@"民族",@"出生日期",@"手机号",@"账户安全",@"捆绑微信",@"捆绑QQ"];
    NSArray * rightArr = @[@"娇娇老师",@"娇娇",@"女",@"汉",@"1982-5-08",@"15151234509",@"",@"已捆绑",@""];
 
    cell.nameLabel.text = [titleArr objectAtIndex:indexPath.row];
    cell.rightLabel.text = [rightArr objectAtIndex:indexPath.row];
    
    if (indexPath.row == 6 || indexPath.row == 8)
    {
        cell.rightImageView.hidden = NO;
    }
    else
    {
        cell.rightImageView.hidden = YES;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [infoTableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 6)
    {
        AccoutSafeViewController * ASVC = [[AccoutSafeViewController alloc] init];
        [self pushToViewController:ASVC];
    }
    else if (indexPath.row == 7)
    {
        
    }
    else if (indexPath.row == 8)
    {
        
    }
}

//更换头像
- (void)takePhoto
{
    UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择", nil];
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSUInteger sourceType = 0;
    
    // 判断是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        if (buttonIndex == 0)
        {
            sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        else if (buttonIndex == 1)
        {
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
        else
        {
            return;
        }
    }
    else
    {
        if (buttonIndex == 0)
        {
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        }
        else if (buttonIndex == 1)
        {
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        }
        else
        {
            return;
        }
    }
    
    // 跳转到相机或相册页面
    if (!imagePicker)
    {
        imagePicker = [[UIImagePickerController alloc] init];
    }
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = sourceType;
    [self presentViewController:imagePicker animated:YES completion:^{}];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

//加模糊效果，image是图片，blur是模糊度
- (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur
{
    //模糊度,
    if ((blur < 0.1f) || (blur > 2.0f)) {
        blur = 0.5f;
    }
    
    //boxSize必须大于0
    int boxSize = (int)(blur * 100);
    boxSize -= (boxSize % 2) + 1;
    
    //图像处理
    CGImageRef img = image.CGImage;
    //需要引入#import <Accelerate/Accelerate.h>
    /*
     This document describes the Accelerate Framework, which contains C APIs for vector and matrix math, digital signal processing, large number handling, and image processing.
     本文档介绍了Accelerate Framework，其中包含C语言应用程序接口（API）的向量和矩阵数学，数字信号处理，大量处理和图像处理。
     */
    
    //图像缓存,输入缓存，输出缓存
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    //像素缓存
    void *pixelBuffer;
    
    //数据源提供者，Defines an opaque type that supplies Quartz with data.
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    // provider’s data.
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    //宽，高，字节/行，data
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //像数缓存，字节行*图片高
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    
    // 第三个中间的缓存区,抗锯齿的效果
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    
    //Convolves a region of interest within an ARGB8888 source image by an implicit M x N kernel that has the effect of a box filter.
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    //    NSLog(@"字节组成部分：%zu",CGImageGetBitsPerComponent(img));
    //颜色空间DeviceRGB
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //用图片创建上下文,CGImageGetBitsPerComponent(img),7,8
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             CGImageGetBitmapInfo(image.CGImage));
    
    //根据上下文，处理过的图片，重新组件
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}

@end
