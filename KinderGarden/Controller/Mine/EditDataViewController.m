//
//  EditDataViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/6/24.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "EditDataViewController.h"
#import "EditDataCell.h"
#import "YWBcityPickerView.h"

#import "UserRequest.h"

@interface EditDataViewController ()
{
    BOOL         _isShow;
    UIView      *_chooseCityView;
}
@property (nonatomic, strong) YWBCityPickerView *cityPickerView;

@end

@implementation EditDataViewController

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

    [headerView loadComponentsWithTitle:@"完善资料" withTitleColor:KFontColorA];
    [headerView backButton];
    _isShow = NO;
    
    rightOneArr = [[NSMutableArray alloc] initWithCapacity:10];
    chargeClassArray = [NSMutableArray array];
    
    infoArray = [NSMutableArray array];
    [infoArray addObject:@"昵称"];
    [infoArray addObject:@"姓名"];
    [infoArray addObject:@"性别"];
    [infoArray addObject:@"民族"];
    [infoArray addObject:@"出生日期"];
    [infoArray addObject:@"负责班级"];
    [infoArray addObject:@"是否在职"];
    
    for (int i = 0; i < infoArray.count; i++)
    {
        [rightOneArr addObject:@""];
    }
    [self createTableView];
    [self createUI];
    [self createPickerView];
    
    [self createSaveBtn];
}

- (void)createSaveBtn
{
    UIButton * saveBtn = [[UIButton alloc] init];
    [saveBtn setTitle:@"提交" forState:UIControlStateNormal];
    saveBtn.titleLabel.font = NormalFontWithSize(15);
    [saveBtn setBackgroundImage:[KPurpleColor image] forState:UIControlStateNormal];
    [saveBtn setTitleColor:KFontColorC forState:UIControlStateNormal];
    [saveBtn setFrame:CGRectMake(0, screenHeight-45, screenWidth, 45)];
    [saveBtn addTarget:self action:@selector(saveBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBtn];
}

- (void)saveBtnOnClick
{
    [UserRequest updateTeacherInfoWithSchoolID:@"1" headerImage:@"http://imgsrc.baidu.com/forum/w%3D580/sign=150d09311b4c510faec4e21250582528/2c5614ce36d3d5392449d83a3b87e950342ab014.jpg" nickName:@"娇娇" teacherName:@"王娇娇" sex:@"0" nationality:@"汉" birthday:@"1990-01-01" phone:[GFStaticData getObjectForKey:kTagUserPhone] kbwx:@"0" kbqq:@"0" classid:@"1" onthejob:@"1" permissions:@"2" analysis:@"1" schoolname:@"北京市幼儿园" delegate:self];
}

- (void)nxRequestFinished:(NXBaseRequest *)request
{
    [[TKAlertCenter defaultCenter] postAlertWithMessage:@"保存成功"];
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
    
    UIView * footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 0.2)];
    footView.backgroundColor = KFontColorE;
    infoTableView.tableFooterView = footView;

    edit = [[EditView defaultEditView] init];
    edit.delegate = self;
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
    nameLabel.text = @"点击左侧上传头像";
    [headView addSubview:nameLabel];
    
    if (!phoneLabel)
    {
        phoneLabel = [[UILabel alloc] init];
    }
    phoneLabel.font = NormalFontWithSize(13);
    phoneLabel.textAlignment = NSTextAlignmentLeft;
    phoneLabel.frame = CGRectMake(CGRectGetMaxX(iconView.frame)+6, CGRectGetMaxY(nameLabel.frame), 180, 20);
    phoneLabel.textColor = KFontColorA;
    phoneLabel.text = [NSString stringWithFormat:@"手机号：%@",[GFStaticData getObjectForKey:kTagUserPhone]];
    [headView addSubview:phoneLabel];
}

- (void)photoBtnOnClick:(UIButton*)sender
{
    [self takePhoto];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return infoArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 5)
    {
        return 1+chargeClassArray.count;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 60)];
    
    EditDataCell * cell = [[EditDataCell alloc] initWithFrame:view.frame];
    cell.nameLabel.text = [infoArray objectAtIndex:section];
    cell.rightLabel.text = [rightOneArr objectAtIndex:section];
    
    [view addSubview:cell];
    
    UIButton * btn = [[UIButton alloc] initWithFrame:view.frame];
    btn.tag = section;
    [btn addTarget:self action:@selector(didSelectSection:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    return view;
}

- (void)didSelectSection:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSInteger index = btn.tag;
    if (index == 0 ||index == 1 || index == 3 || index == 4)
    {
        [edit showView];
        [edit setTitleStr:[rightOneArr objectAtIndex:index]];
    }
    else if (index == 2)
    {
        [self selectSex];
    }
    else if (index == 5)
    {
        UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"柠檬班",@"草莓班",@"大一班",@"中二班", nil];
        sheet.tag = 12;
        [sheet showInView:self.view];
    }
    else if (index == 6)
    {
        [self selectIsOnTheJob];
    }

}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 45)];
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, screenWidth-30, 45)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = NormalFontWithSize(14);
    titleLabel.textColor = [UIColor darkGrayColor];
    
    [cell addSubview:titleLabel];
    
    if (indexPath.row == chargeClassArray.count)
    {
        titleLabel.text = @"添加班级";
    }
    else
    {
        titleLabel.text = [chargeClassArray objectAtIndex:indexPath.row];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //记录编辑哪一行
    if (indexPath.row == chargeClassArray.count && indexPath.section == 5)
    {
        UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"柠檬班",@"草莓班",@"大一班",@"中二班", nil];
        sheet.tag = 12;
        [sheet showInView:self.view];
    }
}

//编辑视图代理--隐藏编辑弹窗
- (void)hideBtnClicked
{
    [edit hideView];
}

//编辑视图代理--确定编辑内容
- (void)sureClick:(NSString *)title
{
    [edit hideView];
    
    [rightOneArr replaceObjectAtIndex:recordRow withObject:title];
    [infoTableView reloadData];
}


- (void)selectIsOnTheJob
{
    UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"是",@"否", nil];
    sheet.tag = 9;
    sheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [sheet showInView:self.view];
}
//选择性别
- (void)selectSex
{
    UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"男",@"女", nil];
    sheet.tag = 10;
    sheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [sheet showInView:self.view];
}

//更换头像
- (void)takePhoto
{
    UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择", nil];
    sheet.tag = 11;
    [sheet showInView:self.view];
}

//选择器（性别、照相）
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 9)
    {
        if (buttonIndex == 0)
        {
            [rightOneArr replaceObjectAtIndex:6 withObject:@"是"];
        }
        else if (buttonIndex == 1)
        {
            [rightOneArr replaceObjectAtIndex:6 withObject:@"否"];
        }
        else if (buttonIndex == 2)
        {
            [rightOneArr replaceObjectAtIndex:6 withObject:@""];
        }
        [infoTableView reloadData];
    }
    if (actionSheet.tag == 10)
    {
        if (buttonIndex == 0)
        {
            [rightOneArr replaceObjectAtIndex:2 withObject:@"男"];
        }
        else if (buttonIndex == 1)
        {
            [rightOneArr replaceObjectAtIndex:2 withObject:@"女"];
        }
        else if (buttonIndex == 2)
        {
            [rightOneArr replaceObjectAtIndex:2 withObject:@""];
        }
        [infoTableView reloadData];
    }
    else if(actionSheet.tag == 11)
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
    else if (actionSheet.tag == 12)
    {
        if (buttonIndex == 4)
        {
            NSLog(@"取消");
            return;
        }
        NSArray * nameArray = @[@"柠檬班",@"草莓班",@"大一班",@"中二班"];
        [chargeClassArray addObject:[nameArray objectAtIndex:buttonIndex]];
        [infoTableView reloadData];
    }
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

//选择地区
- (void)createPickerView
{
    _cityPickerView = [[YWBCityPickerView alloc]init];
    _cityPickerView.backgroundColor = KFontColorA;

    if (!_chooseCityView) {
        _chooseCityView = [[UIView alloc] init];
    }
    _chooseCityView = [[UIView alloc]initWithFrame:CGRectMake(-2, screenHeight, screenWidth+4, 40)];
    _chooseCityView.backgroundColor = [UIColor whiteColor];
    _chooseCityView.layer.borderColor = KFontColorE.CGColor;
    _chooseCityView.layer.borderWidth = 0.6f;
    [self.view addSubview:_chooseCityView];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame = CGRectMake(12, 0, 40, 40);
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(pickerviewbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
    [_chooseCityView addSubview:cancelButton];
    
    UIButton *chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    chooseButton.frame = CGRectMake(screenWidth - 50, 0, 40, 40);
    [chooseButton setTitle:@"确定" forState:UIControlStateNormal];
    [chooseButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [chooseButton addTarget:self action:@selector(pickerviewbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
    [_chooseCityView addSubview:chooseButton];
}

- (void)pickerviewbuttonclick:(UIButton*)sender
{
    if (_isShow) {
        
        [UIView animateWithDuration:0.3f animations:^{
            
            _chooseCityView.frame = CGRectMake(-2, screenHeight, screenWidth+4, 40);
        }];
        [_cityPickerView hiddenPickerView];
        
    }else {
        
        [UIView animateWithDuration:0.3f animations:^{
            
            _chooseCityView.frame = CGRectMake(-2, screenHeight - 240, screenWidth+4, 40);
        }];
        [_cityPickerView showInView:self.view];
    }

    if ([sender.titleLabel.text isEqualToString:@"确定"]) {
        
        NSString *province = [self protectString:_cityPickerView.province];
        NSString *city = [self protectString:_cityPickerView.city];
        NSString *area = [self protectString:_cityPickerView.area];
        
        cityStr = [NSString stringWithFormat:@"%@ %@ %@",province, city, area];
        [rightOneArr replaceObjectAtIndex:2 withObject:cityStr];
    }
  
    _isShow = !_isShow;
    [infoTableView reloadData];
}

- (NSString *)protectString:(NSString *)string {
    if (string == nil || [string isKindOfClass:NULL]) {
        string = @"";
    }
    return string;
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
