//
//  TeatcherInfoViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/6/12.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "TeatcherInfoViewController.h"
#import <Accelerate/Accelerate.h>
#import "FifthCell.h"

@interface TeatcherInfoViewController ()

@end

@implementation TeatcherInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KFontColorA;
    
    [headerView loadComponentsWithTitle:@"李老师" withTitleColor:KFontColorA];
    [headerView backButton];
    
    authStr = @"普通老师";
    
    [self createTableView];
    [self createUI];
}

- (void)createTableView
{
    infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) style:UITableViewStylePlain];
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

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 40)];
    
    NSArray * titleArr = @[@"职务",@"权限",@"昵称",@"姓名",@"性别",@"民族",@"出生日期",@"手机号",@"负责班级",@"班级建立",@"管理老师",@"班级管理",@"离开幼儿园"];
    NSArray * rightArr = @[@"班主任",authStr,@"娇娇老师",@"娇娇",@"女",@"汉",@"1982-5-08",@"15151234509",@"",@"",@"",@"",@""];

    UILabel * leftLabel = [[UILabel alloc] init];
    leftLabel.font = NormalFontWithSize(14);
    leftLabel.frame = CGRectMake(20, 0, 100, 45);
    leftLabel.textAlignment = NSTextAlignmentLeft;
    leftLabel.textColor = KFontColorC;
    leftLabel.text = [titleArr objectAtIndex:section];
    [view addSubview:leftLabel];
    
    UILabel * lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 44.5, screenWidth-20, 0.5)];
    lineLabel.backgroundColor = KFontColorE;
    [view addSubview:lineLabel];
    
    UILabel * rightLabel = [[UILabel alloc] init];
    rightLabel.font = NormalFontWithSize(14);
    rightLabel.frame = CGRectMake(0, 0, screenWidth-15, 45);
    rightLabel.textAlignment = NSTextAlignmentRight;
    rightLabel.textColor = KFontColorB;
    rightLabel.text = [rightArr objectAtIndex:section];
    [view addSubview:rightLabel];
    
    UIButton * sectionBtn = [[UIButton alloc] init];
    sectionBtn.frame = CGRectMake(0, 0, screenWidth, 45);
    sectionBtn.tag = section;
    [sectionBtn setBackgroundColor:[UIColor clearColor]];
    [sectionBtn addTarget:self action:@selector(sectionBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:sectionBtn];

    UIImageView * jiantouIV = [[UIImageView alloc] init];
    jiantouIV.frame = CGRectMake(screenWidth-25, 12.5, 20, 20);
    jiantouIV.image = [UIImage imageNamed:@"icon_youjiantou"];
    [view addSubview:jiantouIV];
  
    if (section == 0 || section == 1||section == 2||section == 3||section == 4||section == 5|section == 6||section == 7 )
    {
        jiantouIV.hidden = YES;
    }

    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 13;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 8)
    {
        
        return 0;
    }
    
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    
    FifthCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[FifthCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
   
    cell.rightImageView.hidden = YES;
    cell.rightLabel.hidden = YES;
    
    cell.nameLabel.text = @"";
    cell.nameLabel.textColor = KFontColorB;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [infoTableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)sectionBtnOnClick:(UIButton*)sender
{
    if (sender.tag == 8)
    {
        NSLog(@"负责班级");
    }
    else if (sender.tag == 9)
    {
        NSLog(@"建立班级");
        //不明白应该是怎么显示
    }
    else if (sender.tag == 10)
    {
        UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:@"权限更改" delegate:self cancelButtonTitle:@"离开" destructiveButtonTitle:nil otherButtonTitles:@"管理员",@"普通老师",@"网站管理员",@"保育员老师", nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
        actionSheet.tag = 1010;
        [actionSheet showInView:self.view];
    }
    else if (sender.tag == 11)
    {
        NSLog(@"班级管理");
        //不明白应该是怎么显示
    }
    else if (sender.tag == 12)
    {
        UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"离开" destructiveButtonTitle:@"确认离校" otherButtonTitles:nil, nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
        actionSheet.tag = 1012;
        [actionSheet showInView:self.view];
    }
}

//UIAcitonSheet 代理方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 1010)
    {
        //管理老师
        if (buttonIndex == 0)
        {
            authStr =@"管理员";
        }
        else if (buttonIndex == 1)
        {
            authStr =@"普通老师";
        }
        else if (buttonIndex == 2)
        {
            authStr =@"网站管理员";
        }
        else if (buttonIndex == 3)
        {
            authStr =@"保育员老师";
        }
        else if (buttonIndex == 4)
        {
            NSLog(@"离开");
        }
    }
    else if (actionSheet.tag == 1012)
    {
        //离开幼儿园
        if (buttonIndex == 0)
        {
            NSLog(@"确认离校");
        }
        else if (buttonIndex == 1)
        {
            NSLog(@"离开");
        }
    }
    
    [infoTableView reloadData];
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
