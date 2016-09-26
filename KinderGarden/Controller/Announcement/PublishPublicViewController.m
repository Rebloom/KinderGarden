//
//  PublishPublicViewController.m
//  KinderGarden
//
//  Created by haonanchen on 16/8/20.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "PublishPublicViewController.h"

#import "NXUploadFileManager.h"

#define MyOrangeColor       MY_COLOR(252,79,30,1)

@interface PublishPublicViewController ()

@end

@implementation PublishPublicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [headerView backButton];
    if (_publishType == PublishTypePublic)
    {
        [headerView loadComponentsWithTitle:@"发布公告"];
    }
    else if (_publishType == PublishTypeParentCircle)
    {
        [headerView loadComponentsWithTitle:@"发布父母圈"];
    }
   
    [headerView publishButton];
    self.view.backgroundColor = NXDefaultGrayBGColor;
    
    
    [self setUI];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap.delegate = self;
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}

- (void)buttonClicked:(id)sender
{
    UIButton * btn = (UIButton *)sender;
    if (btn.tag == 1)
    {
        [self back];
    }
    else if (btn.tag == 2)
    {
        [self submitBtnClicked:nil];
    }
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    NSString * touchObject = NSStringFromClass([touch.view class]);
    
    // 点击的是Button控件
    if([touchObject isEqualToString:@"UIButton"])
    {
        return NO;
    }
    return YES;
}

- (void)viewTapped:(id)sender
{
    if ([goodsDescTextView isFirstResponder])
    {
        [goodsDescTextView resignFirstResponder];
    }
}

- (void)setUI
{
    containerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerView.frame), screenWidth, screenHeight - 64 - 45)];
    containerScrollView.showsVerticalScrollIndicator = NO;
    containerScrollView.showsHorizontalScrollIndicator = NO;
    CGFloat addtionalHeight = 200;
    containerScrollView.contentSize = CGSizeMake(screenWidth, screenHeight+addtionalHeight);
    [self.view addSubview:containerScrollView];
    
    UIView * topContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 200)];
    topContainerView.backgroundColor = [UIColor whiteColor];
    [containerScrollView addSubview:topContainerView];
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 75, 45)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor lightGrayColor];
    titleLabel.font = NormalFontWithSize(15);
    titleLabel.text = @"发布标题";
    [topContainerView addSubview:titleLabel];
    
    titleText = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame)+4, 0, screenWidth-100, 45)];
    titleText.delegate = self;
    titleText.returnKeyType = UIReturnKeyDone;
    titleText.placeholder = @"输入标题";
    [titleText becomeFirstResponder];
    [topContainerView addSubview:titleText];
    
    UIView * line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 45, screenWidth, .5)];
    line1.backgroundColor = [UIColor lightGrayColor];
    [topContainerView addSubview:line1];
    
    goodsDescTextView = [[UITextView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(goodsDescLabel.frame)-4, CGRectGetMaxY(line1.frame)+6, screenWidth-100, 115)];
    goodsDescTextView.delegate = self;
    goodsDescTextView.returnKeyType = UIReturnKeyDone;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 3;
    NSDictionary *attributes = @{
                                 NSStrokeColorAttributeName:[UIColor lightGrayColor],
                                 NSFontAttributeName:NormalFontWithSize(15),
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    goodsDescTextView.typingAttributes = attributes;
    [topContainerView addSubview:goodsDescTextView];
    
    placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(goodsDescLabel.frame), CGRectGetMaxY(line1.frame)+15, screenWidth-100, 50)];
    placeHolderLabel.numberOfLines = 2;
    placeHolderLabel.backgroundColor = [UIColor clearColor];
    placeHolderLabel.text = @"请填写发布内容";
    placeHolderLabel.font = NormalFontWithSize(15);
    placeHolderLabel.textColor = MY_COLOR(200, 200, 200, 1);
    [placeHolderLabel sizeToFit];
    [topContainerView addSubview:placeHolderLabel];
    
    
    UIView * line2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(goodsDescTextView.frame), screenWidth, .5)];
    line2.backgroundColor = [UIColor lightGrayColor];
    [topContainerView addSubview:line2];
    
    UILabel * imageDescLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(line2.frame), screenWidth, 45)];
    imageDescLabel.backgroundColor = NXDefaultGrayBGColor;
    imageDescLabel.font = NormalFontWithSize(15);
    imageDescLabel.textColor = [UIColor lightGrayColor];
    
    NSMutableAttributedString * maStr = [[NSMutableAttributedString alloc] initWithString:@"  选择照片（图片长按可移动）"];
    [maStr addAttribute:NSForegroundColorAttributeName value:MY_COLOR(252, 79, 30, 1) range:NSMakeRange(7, 7)];
    imageDescLabel.attributedText = maStr;
    [topContainerView addSubview:imageDescLabel];
    
    UIView * line3 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageDescLabel.frame), screenWidth, .5)];
    line3.backgroundColor = [UIColor lightGrayColor];
    [topContainerView addSubview:line3];
    
    addPicView = [[NXAddPictureView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(line3.frame), screenWidth, (screenWidth-15)/4)];
    addPicView.delegate = self;
    
    [addPicView.imageArray removeAllObjects];
    
    [addPicView.imageArray addObject:[UIImage imageNamed:@"icon_takePicture"]];
    
    [addPicView reloadPictureViewWithImages];
    [containerScrollView addSubview:addPicView];
    
    takePhoto = [[TakePhotoView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight)];
    takePhoto.delegate = self;
    [self.view addSubview:takePhoto];
}

- (void)submitBtnClicked:(id)sender
{
    if (goodsDescTextView.text.length < 5)
    {
        [self showAlertWithMessage:@"内容不得少于五个字"];
        return;
    }
    else
    {
        submitBtn.enabled = NO;
        [PublicRequest getQiniuTokenWithImageName:@"testjg" delegate:self];
    }
}

- (void)uploadImageArray
{
    NSMutableArray * temp = [addPicView.imageArray mutableCopy];
    [temp removeLastObject];
    if (temp.count)
    {
        [self showLoadingViewWithMessage:@"图片上传中"];
        [[NXUploadFileManager sharedManager] uploadImages:temp delegate:self];
    }
    else
    {
        if (_publishType == PublishTypePublic)
        {
            [PublicRequest publishPublicInfoWithTitle:@"测试" bannerImage:@"" content:@"测试内容ddd" range:@"p" images:@"" videoUrl:@"" operatePersonID:[GFStaticData getObjectForKey:kTagUserKeyID] delegate:self];
        }
        else if (_publishType == PublishTypeParentCircle)
        {
            [PublicRequest addParentPublishWithSchoolID:@"1" address:@"北京市" topic:@"测试标题" content:@"测试内容" topicImage:@"" type:@"p" delegate:self];
        }
    }
}

- (void)nxRequestFinished:(NXBaseRequest *)request
{
    if ([request.vrCodeString isEqualToString:kTagRequestQNToken])
    {
        NSString * uploadToken = [[request.attributeDic objectForKey:@"obj"] objectForKey:@"token"];
        [GFStaticData saveObject:uploadToken forKey:kTagQiniuSDKToken];
        [self uploadImageArray];
    }
    else if ([request.vrCodeString isEqualToString:kTagPublishPublicRequest])
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"发布成功"];
        [self performSelector:@selector(back) withObject:nil afterDelay:1.5];
    }
    else if ([request.vrCodeString isEqualToString:kTagParrentPublishRequest])
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"发布父母圈成功"];
        [self performSelector:@selector(back) withObject:nil afterDelay:1.5];
    }
}

- (void)uploadFileSuccess:(NSDictionary *)back
{
    [self hideAllLoadingView];
    NSString * imageJoinedString = [back objectForKey:@"imageUrls"];
    NSLog(@"bannerImage is %@",[[imageJoinedString componentsSeparatedByString:@","] firstObject]);
    if (_publishType == PublishTypePublic)
    {
        [PublicRequest publishPublicInfoWithTitle:@"测试" bannerImage:[[imageJoinedString componentsSeparatedByString:@","] firstObject] content:@"测试内容ddd" range:@"P" images:imageJoinedString videoUrl:@"" operatePersonID:[GFStaticData getObjectForKey:kTagUserKeyID] delegate:self];
    }
    else if (_publishType == PublishTypeParentCircle)
    {
        [PublicRequest addParentPublishWithSchoolID:@"1" address:@"北京市" topic:titleText.text content:goodsDescTextView.text topicImage:[[imageJoinedString componentsSeparatedByString:@","] firstObject] type:@"p" delegate:self];
    }

}

- (void)uploadFileFailed:(NSError *)error
{
    [self hideAllLoadingView];
    [self showAlertWithMessage:@"图片上传失败"];
}

#pragma BrowseDelegate
- (void)deleteImageAtIndex:(NSInteger)index
{
    if (index < addPicView.imageArray.count-1)
    {
        [addPicView.imageArray removeObjectAtIndex:index];
        [addPicView reloadPictureViewWithImages];
    }
}

- (NSInteger)currentNumberOfPictures
{
    return addPicView.imageArray.count-1;
}

#pragma TakePhotoViewDelegate
- (void)didSelectImage:(UIImage *)image
{
    [addPicView.imageArray insertObject:image atIndex:addPicView.imageArray.count-1];
    [addPicView reloadPictureViewWithImages];
    
    //    submitBtn.frame = CGRectMake(80, CGRectGetMaxY(addPicView.frame)+20, screenWidth-160, 45);
}

- (void)didSelectImages:(NSArray *)assetImageArr
{
    for (UIImage * image in assetImageArr)
    {
        [addPicView.imageArray insertObject:image atIndex:addPicView.imageArray.count-1];
    }
    [addPicView reloadPictureViewWithImages];
    //    submitBtn.frame = CGRectMake(80, CGRectGetMaxY(addPicView.frame)+20, screenWidth-160, 45);
    
    [takePhoto hide];
}

- (void)didSelectMaxNum
{
    [self showAlertWithMessage:@"最多添加15张图片"];
}

#pragma ImageViewDelegate
- (void)imageViewClickedAtIndex:(NSInteger)index
{
    if (index == addPicView.imageArray.count-1)
    {
        if (addPicView.imageArray.count == 16)
        {
            [self showAlertWithMessage:@"最多添加15张图片"];
        }
        else
        {
            // resignFirstResponder
            [self viewTapped:nil];
            [takePhoto show];
            takePhoto.maxNumsOfSelect = 16-addPicView.imageArray.count;
        }
    }
}

- (void)imageViewDeleteAtIndex:(NSInteger)index
{
    if (index < addPicView.imageArray.count-1)
    {
        [addPicView.imageArray removeObjectAtIndex:index];
        [addPicView reloadPictureViewWithImages];
    }
}

#pragma TextViewDelegate
- (void)textViewDidChange:(UITextView *)textView
{
    if(textView.text.length)
    {
        placeHolderLabel.text = @"";
    }
    else
    {
        placeHolderLabel.text = @"请填写发布内容";
    }
    
    if (textView.text.length > 1000)
    {
        textView.text = [textView.text substringToIndex:1000];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (textView.text.length > 1000)
    {
        return NO;
    }
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
