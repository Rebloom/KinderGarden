//
//  FifthViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "FifthViewController.h"
#import <Accelerate/Accelerate.h>
#import "AccoutInfoViewController.h"
#import "FifthCell.h"
#import "SchoolInfoViewController.h"
#import "EditDataViewController.h"

@interface FifthViewController ()

@end

@implementation FifthViewController

- (void)createEditBtn
{
    UIButton * editBtn = [[UIButton alloc] init];
    editBtn.backgroundColor = [UIColor clearColor];
    editBtn.titleLabel.font = NormalFontWithSize(14);
    editBtn.frame = CGRectMake(screenWidth-60, 20, 40, 40);
    [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [editBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
    [editBtn addTarget:self action:@selector(editBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:editBtn];
}

- (void)editBtnOnClick
{
    EditDataViewController * EDVC = [[EditDataViewController alloc] init];
    [self pushToViewController:EDVC];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [headerView loadComponentsWithTitle:@"个人中心" withTitleColor:KFontColorA];
    
    [self createEditBtn];
    [self createTableView];
    [self createUI];
    
    [self requestTeacherInfo];
}

- (void)requestTeacherInfo
{
    [UserRequest requestTeacherInfoWithDelegate:self];
}

- (void)nxRequestFinished:(NXBaseRequest *)request
{
    NSLog(@"request back is %@",request.attributeDic);
}

- (void)createTableView
{
    infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64) style:UITableViewStylePlain];
    infoTableView.delegate = self;
    infoTableView.dataSource = self;
    infoTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:infoTableView];
    
    if (!headView)
    {
        headView = [[UIImageView alloc] init];
    }
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    
    FifthCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[FifthCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSArray * titleArr = @[@"账号信息",@"完善资料",@"学校信息",@"父母圈",@"设置",@"家长咨询"];
    
    cell.nameLabel.text = [titleArr objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [infoTableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0)
    {
        AccoutInfoViewController * AIVC = [[AccoutInfoViewController alloc] init];
        [self pushToViewController:AIVC];
    }
    else if (indexPath.row == 1)
    {
        EditDataViewController * EDVC = [[EditDataViewController alloc] init];
        [self pushToViewController:EDVC];
    }
    else if (indexPath.row == 2)
    {
        SchoolInfoViewController * SIVC = [[SchoolInfoViewController alloc] init];
        [self pushToViewController:SIVC];
    }
    else if (indexPath.row == 3)
    {
        
    }
    else if (indexPath.row == 4)
    {
        
    }
    else if (indexPath.row == 5)
    {
        
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
