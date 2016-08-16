//
//  ThirdViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "ThirdViewController.h"
#import <Accelerate/Accelerate.h>

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)createMyAnounce
{
    UIButton * myAnounceBtn = [[UIButton alloc] init];
    myAnounceBtn.backgroundColor = [UIColor clearColor];
    myAnounceBtn.titleLabel.font = NormalFontWithSize(14);
    myAnounceBtn.frame = CGRectMake(screenWidth-70, 25, 60, 30);
    [myAnounceBtn setTitle:@"我的发布" forState:UIControlStateNormal];
    [myAnounceBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
    [myAnounceBtn addTarget:self action:@selector(myAnounceBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:myAnounceBtn];
}

- (void)myAnounceBtnOnClick
{
    NSLog(@"我的发布");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [headerView loadComponentsWithTitle:@"选择发布类别" withTitleColor:KFontColorA];
    [self createMyAnounce];
    [self createUI];
}

- (void)createUI
{
    NSArray * titleArr = @[@"宝宝秀",@"发布通知",@"饮食",@"课程表",@"父母圈",@"宝宝档案",@"聊天"];
    NSArray * picArr = @[@"babyShow",@"anounce",@"diet",@"course",@"FMChat",@"babyFile",@"chat"];
    
    if(!mainView)
    {
        mainView = [[UIImageView alloc] init];
    }
    mainView.backgroundColor = [@"e4e5e7".color colorWithAlphaComponent:0.4];
    mainView.frame = CGRectMake(0, 64, screenWidth, screenHeight-64);
    mainView.userInteractionEnabled = YES;
    [self.view addSubview:mainView];

    for (int i =0; i<7; i++)
    {
        UIButton * cheakBtn = [[UIButton alloc] init];
        cheakBtn.tag = 1000 +i;
        [cheakBtn setBackgroundImage:[[UIColor clearColor] image] forState:UIControlStateNormal];
        [cheakBtn addTarget:self action:@selector(cheakBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [mainView addSubview:cheakBtn];
        
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:[picArr objectAtIndex:i]];
        [cheakBtn addSubview:imageView];
        
        UILabel * titleLabel = [[UILabel alloc] init];
        titleLabel.text = [titleArr objectAtIndex:i];
        titleLabel.textColor = KFontColorC;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = NormalFontWithSize(13);
        [cheakBtn addSubview:titleLabel];
        
        if(i <4)
        {
            cheakBtn.frame = CGRectMake(i*(screenWidth/4),0,screenWidth/4,100);
            imageView.frame = CGRectMake((screenWidth/4-46)/2,20 ,46, 46);
            titleLabel.frame = CGRectMake(0, CGRectGetMaxY(imageView.frame)+5, CGRectGetWidth(cheakBtn.frame), 20);
        }
        else
        {
            cheakBtn.frame = CGRectMake((i-4)*(screenWidth/4),100,screenWidth/4,100);
            imageView.frame = CGRectMake((screenWidth/4-46)/2,20 ,46, 46);
            titleLabel.frame = CGRectMake(0, CGRectGetMaxY(imageView.frame)+5, CGRectGetWidth(cheakBtn.frame), 20);
        }
    }
}

- (void)cheakBtnOnClick:(UIButton*)sender
{
    if (sender.tag == 1000)
    {
        BabyShowViewController * BSVC = [[BabyShowViewController alloc] init];
        [self pushToViewController:BSVC];
    }
    else if (sender.tag == 1001)
    {
        NSLog(@"发布通知");
    }
    else if (sender.tag == 1002)
    {
        CookbookViewController * CKVC = [[CookbookViewController alloc] init];
        [self pushToViewController:CKVC];
    }
    else if (sender.tag == 1003)
    {
        CoursesViewController * CVC = [[CoursesViewController alloc] init];
        [self pushToViewController:CVC];
    }
    else if (sender.tag == 1004)
    {
        NSLog(@"父母圈");
    }
    else if (sender.tag == 1005)
    {
        ChildListViewController * CLVC = [[ChildListViewController alloc] init];
        [self pushToViewController:CLVC];
    }

    else if (sender.tag == 1006)
    {
        NSLog(@"聊天");
    }
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
