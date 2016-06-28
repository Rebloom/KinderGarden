//
//  ThirdViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "ThirdViewController.h"
#import <Accelerate/Accelerate.h>

#define EQULEWIDTH   90
@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createRound];
}

- (void)createRound
{
    //背景图
    UIImageView * iamgeView = [[UIImageView alloc] init];
    iamgeView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    CGRect rect1 = CGRectMake(0, 0, screenWidth*2, screenHeight*2);
    UIImage * image2 = [UIImage imageWithCGImage:CGImageCreateWithImageInRect([[UIImage imageNamed:@"backImage.jpg"] CGImage], rect1)];
    iamgeView.image = [self blurryImage:image2 withBlurLevel:0.8];
    [self.view addSubview:iamgeView];
    
    UIImageView * bgView = [[UIImageView alloc] init];
    bgView.image = [UIImage imageNamed:@"bgPic"];
    bgView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    [iamgeView addSubview:bgView];
    
    UIImageView * roundView = [[UIImageView alloc] init];
    roundView.clipsToBounds = YES;
    roundView.frame = CGRectMake(10,screenHeight/2-screenWidth/2, screenWidth-20, screenWidth-20);
    roundView.layer.masksToBounds = YES;
    roundView.layer.cornerRadius = (screenWidth-20)/2;
    roundView.backgroundColor = [@"#d5d4fb".color colorWithAlphaComponent:0.3];
    [self.view addSubview:roundView];
    
    NSArray * titleArr = @[@"聊天",@"问答",@"发布通知",@"宝宝档案",@"父母圈",@"课程",@"宝宝秀"];
    NSArray * picArr = @[@"chat",@"ask",@"anounce",@"babyFile",@"FMChat",@"course",@"babyShow"];
    for (int i = 0; i<7; i++)
    {
        UIButton * cheakBtn = [[UIButton alloc] init];
        cheakBtn.tag = 1000 +i;
        cheakBtn.layer.cornerRadius = EQULEWIDTH/2;
        cheakBtn.layer.masksToBounds = YES;
        cheakBtn.userInteractionEnabled = YES;
        [cheakBtn setBackgroundImage:[[UIColor clearColor] image] forState:UIControlStateNormal];
        [cheakBtn addTarget:self action:@selector(cheakBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:cheakBtn];
    
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:[picArr objectAtIndex:i]];
        [cheakBtn addSubview:imageView];

        if(i == 0)
        {
            cheakBtn.frame = CGRectMake(CGRectGetWidth(roundView.frame)/2-45+CGRectGetMinX(roundView.frame), 0+CGRectGetMinY(roundView.frame), EQULEWIDTH, EQULEWIDTH);
            imageView.frame = CGRectMake((CGRectGetWidth(cheakBtn.frame)-54)/2, (CGRectGetHeight(cheakBtn.frame)-43)/2, 54, 43);

        }
        else if (i == 1)
        {
            cheakBtn.frame = CGRectMake(CGRectGetWidth(roundView.frame)-105+CGRectGetMinX(roundView.frame), 65+CGRectGetMinY(roundView.frame), EQULEWIDTH, EQULEWIDTH);
            imageView.frame = CGRectMake((CGRectGetWidth(cheakBtn.frame)-50)/2, (CGRectGetHeight(cheakBtn.frame)-50)/2, 50, 50);
        }
        else if (i == 2)
        {
            if (iPhone5||iPhone4s)
            {
                cheakBtn.frame = CGRectMake(CGRectGetWidth(roundView.frame)-105+CGRectGetMinX(roundView.frame), 160+CGRectGetMinY(roundView.frame), EQULEWIDTH, EQULEWIDTH);
            }
            else if(iPhone6)
            {
                cheakBtn.frame = CGRectMake(CGRectGetWidth(roundView.frame)-105+CGRectGetMinX(roundView.frame), 180+CGRectGetMinY(roundView.frame), EQULEWIDTH, EQULEWIDTH);
            }
            else if(iPhone6Plus)
            {
                cheakBtn.frame = CGRectMake(CGRectGetWidth(roundView.frame)-105+CGRectGetMinX(roundView.frame), 220+CGRectGetMinY(roundView.frame), EQULEWIDTH, EQULEWIDTH);
            }
            else
            {
                 cheakBtn.frame = CGRectMake(CGRectGetWidth(roundView.frame)-105+CGRectGetMinX(roundView.frame), 190+CGRectGetMinY(roundView.frame), EQULEWIDTH, EQULEWIDTH);
            }
            imageView.frame = CGRectMake((CGRectGetWidth(cheakBtn.frame)-43)/2, (CGRectGetHeight(cheakBtn.frame)-45)/2, 43, 45);
        }
        else if (i == 3)
        {
            cheakBtn.frame = CGRectMake(CGRectGetWidth(roundView.frame)/2-45+CGRectGetMinX(roundView.frame), CGRectGetHeight(roundView.frame)-100+CGRectGetMinY(roundView.frame), EQULEWIDTH, EQULEWIDTH);
            imageView.frame = CGRectMake((CGRectGetWidth(cheakBtn.frame)-44)/2, (CGRectGetHeight(cheakBtn.frame)-46)/2, 44, 46);
        }
        else if (i == 4)
        {
            if (iPhone5||iPhone4s)
            {
                cheakBtn.frame = CGRectMake(15+CGRectGetMinX(roundView.frame), 160+CGRectGetMinY(roundView.frame), EQULEWIDTH, EQULEWIDTH);
            }
            else if(iPhone6)
            {
                cheakBtn.frame = CGRectMake(15+CGRectGetMinX(roundView.frame), 180+CGRectGetMinY(roundView.frame), EQULEWIDTH, EQULEWIDTH);
            }
            else if(iPhone6Plus)
            {
                cheakBtn.frame = CGRectMake(15+CGRectGetMinX(roundView.frame), 220+CGRectGetMinY(roundView.frame), EQULEWIDTH, EQULEWIDTH);
            }
            else
            {
                cheakBtn.frame = CGRectMake(15+CGRectGetMinX(roundView.frame), 190+CGRectGetMinY(roundView.frame), EQULEWIDTH, EQULEWIDTH);
            }
            imageView.frame = CGRectMake((CGRectGetWidth(cheakBtn.frame)-45)/2, (CGRectGetHeight(cheakBtn.frame)-45)/2,45, 45);
        }
        else if (i == 5)
        {
            cheakBtn.frame = CGRectMake(15+CGRectGetMinX(roundView.frame), 65+CGRectGetMinY(roundView.frame), EQULEWIDTH, EQULEWIDTH);
            imageView.frame = CGRectMake((CGRectGetWidth(cheakBtn.frame)-55)/2, (CGRectGetHeight(cheakBtn.frame)-45)/2, 55, 45);
        }
        else if (i == 6)
        {
            cheakBtn.frame = CGRectMake(CGRectGetWidth(roundView.frame)/2-45+CGRectGetMinX(roundView.frame), CGRectGetHeight(roundView.frame)/2-45+CGRectGetMinY(roundView.frame), EQULEWIDTH, EQULEWIDTH);
            imageView.frame = CGRectMake((CGRectGetWidth(cheakBtn.frame)-45)/2, (CGRectGetHeight(cheakBtn.frame)-40)/2, 45, 40);
            [cheakBtn setBackgroundImage:[@"#817fd1".color image] forState:UIControlStateNormal];
        }
        
        UILabel * titleLabel = [[UILabel alloc] init];
        titleLabel.text = [titleArr objectAtIndex:i];
        titleLabel.textColor = KFontColorA;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = NormalFontWithSize(13);
        titleLabel.frame = CGRectMake(0, CGRectGetMaxY(imageView.frame), CGRectGetWidth(cheakBtn.frame), 20);
        [cheakBtn addSubview:titleLabel];
    }
 }

- (void)cheakBtnOnClick:(UIButton*)sender
{
    if (sender.tag == 1000)
    {
        NSLog(@"聊天");
    }
    else if (sender.tag == 1001)
    {
        NSLog(@"问答");
    }
    else if (sender.tag == 1002)
    {
        NSLog(@"发布通知");
    }
    else if (sender.tag == 1003)
    {
        ChildListViewController * CLVC = [[ChildListViewController alloc] init];
        [self pushToViewController:CLVC];
    }
    else if (sender.tag == 1004)
    {
        NSLog(@"父母圈");
    }
    else if (sender.tag == 1005)
    {
        CoursesViewController * CVC = [[CoursesViewController alloc] init];
        [self pushToViewController:CVC];
    }
    else if (sender.tag == 1006)
    {
        BabyShowViewController * BSVC = [[BabyShowViewController alloc] init];
        [self pushToViewController:BSVC];
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
