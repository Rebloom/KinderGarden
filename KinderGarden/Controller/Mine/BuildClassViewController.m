//
//  BuildClassViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/5/19.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BuildClassViewController.h"
#import "AddTeatcherViewController.h"

@interface BuildClassViewController ()

@end

@implementation BuildClassViewController

- (void)createCommitBtn
{
    UIButton * commitBtn = [[UIButton alloc] init];
    commitBtn.titleLabel.font = NormalFontWithSize(14);
    commitBtn.frame = CGRectMake(screenWidth-60, 20, 50, 44);
    [commitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [commitBtn setTitleColor:KFontColorC forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(commitBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:commitBtn];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KFontColorA;
    
    [headerView loadComponentsWithTitle:@"学校信息" withTitleColor:KBlackColor];
    [headerView setBackgroundColor:KFontColorA];
    [headerView backButton];
    
    [self createCommitBtn];
    [self createUI];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [self.view addGestureRecognizer:tap];
}

- (void)createUI
{
    NSArray * leftArr = @[@"班级名称",@"添加班主任",@"添加老师"];
    for (int i = 0; i < 3; i++)
    {
        UIButton * buildClassBtn = [[UIButton alloc] init];
        buildClassBtn.tag = 1000+i;
        buildClassBtn.frame =CGRectMake(0, 75+i*45, screenWidth, 45);
        [buildClassBtn setBackgroundImage:[KFontColorA image] forState:UIControlStateNormal];
        [buildClassBtn setBackgroundImage:[@"#e2e2e2".color image] forState:UIControlStateSelected];
        [buildClassBtn setBackgroundImage:[@"#e2e2e2".color image] forState:UIControlStateHighlighted];
        [buildClassBtn addTarget:self action:@selector(buildClassBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:buildClassBtn];
        
        UILabel * leftLabel = [[UILabel alloc] init];
        leftLabel.text = [leftArr objectAtIndex:i];
        leftLabel.textAlignment = NSTextAlignmentLeft;
        leftLabel.frame = CGRectMake(15,0, 150, 45);
        leftLabel.font = NormalFontWithSize(15);
        leftLabel.textColor = KFontColorC;
        [buildClassBtn addSubview:leftLabel];
        
        UILabel * lineLabel = [[UILabel alloc] init];
        lineLabel.backgroundColor = KFontColorE;
        if (i == 2)
        {
            lineLabel.frame = CGRectMake(0, 44.5, screenWidth, 0.5);
        }
        else
        {
            lineLabel.frame = CGRectMake(15, 44.5, screenWidth, 0.5);
        }
        [buildClassBtn addSubview:lineLabel];
        
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"right"];
        imageView.frame = CGRectMake(screenWidth - 20.5, 15, 8.5, 15);
        [buildClassBtn addSubview:imageView];
        if (i == 0)
        {
            imageView.hidden = YES;
        }
        else
        {
            imageView.hidden = NO;
        }
    }
    
    if (!classNameTf)
    {
        classNameTf = [[UITextField alloc] init];
    }
    classNameTf.backgroundColor = [UIColor clearColor];
    classNameTf.frame = CGRectMake(screenWidth-20-107, 77, 107, 41);
    classNameTf.textAlignment = NSTextAlignmentRight;
    classNameTf.font = NormalFontWithSize(14);
    UIColor *color = KFontColorB;
    classNameTf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入班级名称" attributes:@{NSForegroundColorAttributeName: color}];
    classNameTf.textColor = KFontColorC;
    classNameTf.delegate = self;
    [self.view addSubview:classNameTf];
}

- (void)commitBtnOnClick:(UIButton*)sender
{
    NSLog(@"提交");
}

- (void)buildClassBtnOnClick:(UIButton*)sender
{
    if (sender.tag == 1000)
    {
        NSLog(@"班级名称");
    }
    else if (sender.tag == 1001)
    {
        NSLog(@"添加班主任");
    }
    else if (sender.tag == 1002)
    {
        NSLog(@"添加老师");
        AddTeatcherViewController * ATVC = [[AddTeatcherViewController alloc] init];
        [self pushToViewController:ATVC];
    }
}

// 点击页面，输入框失去焦点
- (void)viewTapped:(UITapGestureRecognizer*)ges
{
    if([classNameTf isFirstResponder])
    {
        [classNameTf resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
