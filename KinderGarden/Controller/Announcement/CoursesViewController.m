//
//  CoursesViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/6/28.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "CoursesViewController.h"

@interface CoursesViewController ()

@end

@implementation CoursesViewController

- (void)createClass
{
    UIImageView * shaixuanIV = [[UIImageView alloc] init];
    shaixuanIV.image = [UIImage imageNamed:@"未筛选"];
    shaixuanIV.frame = CGRectMake(screenWidth-20-13, 30, 23, 22);
    [headerView addSubview:shaixuanIV];
    
    UIButton * shaixuanBtn = [[UIButton alloc]init];
    shaixuanBtn.frame = CGRectMake(screenWidth-43, 20, 43, 40);
    [shaixuanBtn addTarget:self action:@selector(shaixuanBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:shaixuanBtn];
}

//筛选班级
- (void)shaixuanBtnOnClick:(UIButton*)sender
{
    mainView.hidden = NO;
    [self.view bringSubviewToFront:mainView];
}

//完成
- (void)finishBtnOnClick:(UIButton*)sender
{
    NSLog(@"完成");
    
    mainView.hidden = YES;
    [headerView loadComponentsWithTitle:classTitle withTitleColor:KFontColorA];
}

#pragma mark ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓封装筛选班级↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
- (void)selectBtnOnClick:(UIButton*)sender
{
    UIImageView * oneIV = (UIImageView*)[bgView viewWithTag:2000];
    UIImageView * towIV = (UIImageView*)[bgView viewWithTag:2001];
    UIImageView * threeIV = (UIImageView*)[bgView viewWithTag:2002];
    UIImageView * fourIV = (UIImageView*)[bgView viewWithTag:2003];
    UIImageView * fiveIV = (UIImageView*)[bgView viewWithTag:2004];
    UIImageView * sixIV = (UIImageView*)[bgView viewWithTag:2005];
    UIImageView * sevenIV = (UIImageView*)[bgView viewWithTag:2006];
    UIImageView * eightIV = (UIImageView*)[bgView viewWithTag:2007];
    UIImageView * nineIV = (UIImageView*)[bgView viewWithTag:2008];

    if (sender.tag == 3000)
    {
        classTitle = @"大一班课程";
        
        oneIV.image = [UIImage imageNamed:@"班级选择"];
        towIV.image = [UIImage imageNamed:@"班级未选中"];
        threeIV.image = [UIImage imageNamed:@"班级未选中"];
        fourIV.image = [UIImage imageNamed:@"班级未选中"];
        fiveIV.image = [UIImage imageNamed:@"班级未选中"];
        sixIV.image = [UIImage imageNamed:@"班级未选中"];
        sevenIV.image = [UIImage imageNamed:@"班级未选中"];
        eightIV.image = [UIImage imageNamed:@"班级未选中"];
        nineIV.image = [UIImage imageNamed:@"班级未选中"];
    }
    else if (sender.tag == 3001)
    {
        classTitle = @"大二班课程";

        oneIV.image = [UIImage imageNamed:@"班级未选中"];
        towIV.image = [UIImage imageNamed:@"班级选择"];
        threeIV.image = [UIImage imageNamed:@"班级未选中"];
        fourIV.image = [UIImage imageNamed:@"班级未选中"];
        fiveIV.image = [UIImage imageNamed:@"班级未选中"];
        sixIV.image = [UIImage imageNamed:@"班级未选中"];
        sevenIV.image = [UIImage imageNamed:@"班级未选中"];
        eightIV.image = [UIImage imageNamed:@"班级未选中"];
        nineIV.image = [UIImage imageNamed:@"班级未选中"];
    }
    else if (sender.tag == 3002)
    {
        classTitle = @"大三班课程";

        oneIV.image = [UIImage imageNamed:@"班级未选中"];
        towIV.image = [UIImage imageNamed:@"班级未选中"];
        threeIV.image = [UIImage imageNamed:@"班级选择"];
        fourIV.image = [UIImage imageNamed:@"班级未选中"];
        fiveIV.image = [UIImage imageNamed:@"班级未选中"];
        sixIV.image = [UIImage imageNamed:@"班级未选中"];
        sevenIV.image = [UIImage imageNamed:@"班级未选中"];
        eightIV.image = [UIImage imageNamed:@"班级未选中"];
        nineIV.image = [UIImage imageNamed:@"班级未选中"];
    }
    else if (sender.tag == 3003)
    {
        classTitle = @"中一班课程";

        oneIV.image = [UIImage imageNamed:@"班级未选中"];
        towIV.image = [UIImage imageNamed:@"班级未选中"];
        threeIV.image = [UIImage imageNamed:@"班级未选中"];
        fourIV.image = [UIImage imageNamed:@"班级选择"];
        fiveIV.image = [UIImage imageNamed:@"班级未选中"];
        sixIV.image = [UIImage imageNamed:@"班级未选中"];
        sevenIV.image = [UIImage imageNamed:@"班级未选中"];
        eightIV.image = [UIImage imageNamed:@"班级未选中"];
        nineIV.image = [UIImage imageNamed:@"班级未选中"];
    }
    else if (sender.tag == 3004)
    {
        classTitle = @"中二班课程";

        oneIV.image = [UIImage imageNamed:@"班级未选中"];
        towIV.image = [UIImage imageNamed:@"班级未选中"];
        threeIV.image = [UIImage imageNamed:@"班级未选中"];
        fourIV.image = [UIImage imageNamed:@"班级未选中"];
        fiveIV.image = [UIImage imageNamed:@"班级选择"];
        sixIV.image = [UIImage imageNamed:@"班级未选中"];
        sevenIV.image = [UIImage imageNamed:@"班级未选中"];
        eightIV.image = [UIImage imageNamed:@"班级未选中"];
        nineIV.image = [UIImage imageNamed:@"班级未选中"];
    }
    else if (sender.tag == 3005)
    {
        classTitle = @"中三班课程";

        oneIV.image = [UIImage imageNamed:@"班级未选中"];
        towIV.image = [UIImage imageNamed:@"班级未选中"];
        threeIV.image = [UIImage imageNamed:@"班级未选中"];
        fourIV.image = [UIImage imageNamed:@"班级未选中"];
        fiveIV.image = [UIImage imageNamed:@"班级未选中"];
        sixIV.image = [UIImage imageNamed:@"班级选择"];
        sevenIV.image = [UIImage imageNamed:@"班级未选中"];
        eightIV.image = [UIImage imageNamed:@"班级未选中"];
        nineIV.image = [UIImage imageNamed:@"班级未选中"];
    }
    else if (sender.tag == 3006)
    {
        classTitle = @"小一班课程";

        oneIV.image = [UIImage imageNamed:@"班级未选中"];
        towIV.image = [UIImage imageNamed:@"班级未选中"];
        threeIV.image = [UIImage imageNamed:@"班级未选中"];
        fourIV.image = [UIImage imageNamed:@"班级未选中"];
        fiveIV.image = [UIImage imageNamed:@"班级未选中"];
        sixIV.image = [UIImage imageNamed:@"班级未选中"];
        sevenIV.image = [UIImage imageNamed:@"班级选择"];
        eightIV.image = [UIImage imageNamed:@"班级未选中"];
        nineIV.image = [UIImage imageNamed:@"班级未选中"];
    }
    else if (sender.tag == 3007)
    {
        classTitle = @"小二班课程";

        oneIV.image = [UIImage imageNamed:@"班级未选中"];
        towIV.image = [UIImage imageNamed:@"班级未选中"];
        threeIV.image = [UIImage imageNamed:@"班级未选中"];
        fourIV.image = [UIImage imageNamed:@"班级未选中"];
        fiveIV.image = [UIImage imageNamed:@"班级未选中"];
        sixIV.image = [UIImage imageNamed:@"班级未选中"];
        sevenIV.image = [UIImage imageNamed:@"班级未选中"];
        eightIV.image = [UIImage imageNamed:@"班级选择"];
        nineIV.image = [UIImage imageNamed:@"班级未选中"];
    }
    else if (sender.tag == 3008)
    {
        classTitle = @"小三班课程";

        oneIV.image = [UIImage imageNamed:@"班级未选中"];
        towIV.image = [UIImage imageNamed:@"班级未选中"];
        threeIV.image = [UIImage imageNamed:@"班级未选中"];
        fourIV.image = [UIImage imageNamed:@"班级未选中"];
        fiveIV.image = [UIImage imageNamed:@"班级未选中"];
        sixIV.image = [UIImage imageNamed:@"班级未选中"];
        sevenIV.image = [UIImage imageNamed:@"班级未选中"];
        eightIV.image = [UIImage imageNamed:@"班级未选中"];
        nineIV.image = [UIImage imageNamed:@"班级选择"];
    }
}

//隐藏视图
- (void)hideBtnOnClick:(UIButton*)sender
{
    mainView.hidden = YES;
}

- (void)createSelectClssView
{
    if (!mainView)
    {
        mainView = [[UIView alloc] init];
    }
    mainView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    mainView.backgroundColor = [KFontColorC colorWithAlphaComponent:0.3];
    [self.view addSubview:mainView];
    
    if (!hideBtn)
    {
        hideBtn = [[UIButton alloc] init];
    }
    hideBtn.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    hideBtn.backgroundColor = [UIColor clearColor];
    [hideBtn addTarget:self action:@selector(hideBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:hideBtn];
    
    if (!bgView)
    {
        bgView = [[UIView alloc] init];
    }
    bgView.backgroundColor = KFontColorA;
    bgView.layer.cornerRadius = 4;
    bgView.layer.masksToBounds = YES;
    bgView.frame = CGRectMake((screenWidth-270)/2, 64, 270, 380);
    [mainView addSubview:bgView];
    
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, 22,  CGRectGetWidth(bgView.frame), 20);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = KFontColorB;
    titleLabel.text = @"选择班级";
    titleLabel.font = MediumSTFontWithSize(15);
    [bgView addSubview:titleLabel];
    
    NSArray * classArr = @[@"大一班",@"大二班",@"大三班",@"中一班",@"中二班",@"中三班",@"小一班",@"小二班",@"小三班"];
    
    for (int i = 0; i<9; i++)
    {
        UILabel * classLabel = [[UILabel alloc] init];
        classLabel.frame = CGRectMake(25, 50+30*i, 100, 20);
        classLabel.textAlignment = NSTextAlignmentLeft;
        classLabel.textColor = KFontColorC;
        classLabel.text = [classArr objectAtIndex:i];
        classLabel.font = MediumSTFontWithSize(13);
        [bgView addSubview:classLabel];
        
        UIImageView * selectImageView = [[UIImageView alloc] init];
        selectImageView.image = [UIImage imageNamed:@"班级未选中"];
        selectImageView.tag = 2000+i;
        selectImageView.frame = CGRectMake(CGRectGetWidth(bgView.frame)-37-10, CGRectGetMinY(classLabel.frame)+10, 10.5, 10.5);
        [bgView addSubview:selectImageView];
        
        UIButton * selectBtn = [[UIButton alloc] init];
        selectBtn.frame = CGRectMake(CGRectGetWidth(bgView.frame)-37-20,  CGRectGetMinY(classLabel.frame), 30, 30);
        selectBtn.tag = 3000+i;
        [selectBtn addTarget:self action:@selector(selectBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:selectBtn];
    }
    
    
    UIButton * finishBtn = [[UIButton alloc] init];
    finishBtn.frame = CGRectMake(0, CGRectGetHeight(bgView.frame)- 50, CGRectGetWidth(bgView.frame), 50);
    [finishBtn setTitle:@"完成" forState:UIControlStateNormal];
    [finishBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
    finishBtn.backgroundColor = KPurpleColor;
    finishBtn.titleLabel.font = NormalFontWithSize(15);
    [finishBtn addTarget:self action:@selector(finishBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:finishBtn];
    
    mainView.hidden = YES;
}
#pragma mark ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑封装筛选班级↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = kBackgroundColor;
    
    [headerView loadComponentsWithTitle:@"" withTitleColor:KFontColorA];
    [headerView backButton];

    classOneArr = [[NSMutableArray alloc] initWithCapacity:10];
    classTwoArr = [[NSMutableArray alloc] initWithCapacity:10];
    classNum = 0;
    classTitle = @"";
    recordSection = 0;
    recordRow = 0;
    
    [self createClass];
    [self createScrollView];
    [self createUI];

#warning 待封装
    [self createSelectClssView];
    [self createEditView];

    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [self.view addGestureRecognizer:tap];
}

- (void)createScrollView
{
    SV = [[UIScrollView alloc] init];
    SV.frame = CGRectMake(0, 64, screenWidth, 30);
    SV.delegate = self;
    SV.backgroundColor = KFontColorA;
    SV.showsHorizontalScrollIndicator = NO;
    SV.contentSize = CGSizeMake(55*7, 30);
    [self.view addSubview:SV];
    
    NSArray * dayArr = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
    
    for (int i = 0; i<7; i++)
    {
        UIButton * dayBtn = [[UIButton alloc] init];
        dayBtn.tag = 1000+i;
        dayBtn.titleLabel.font = NormalFontWithSize(14);
        dayBtn.frame = CGRectMake(12+i*55, 5, 43, 20);
        [dayBtn setTitle:[dayArr objectAtIndex:i] forState:UIControlStateNormal];
        [dayBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
        [dayBtn setBackgroundImage:[KPurpleColor image] forState:UIControlStateNormal];
        [dayBtn addTarget:self action:@selector(dayBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [SV addSubview:dayBtn];
    }
}

- (void)dayBtnOnClick:(UIButton*)sender
{
    if (sender.tag == 1000)
    {
        NSLog(@"周一");
    }
    else if (sender.tag == 1001)
    {
        NSLog(@"周二");
    }
    else if (sender.tag == 1002)
    {
        NSLog(@"周三");
    }
    else if (sender.tag == 1003)
    {
        NSLog(@"周四");
    }
    else if (sender.tag == 1004)
    {
        NSLog(@"周五");
    }
    else if (sender.tag == 1005)
    {
        NSLog(@"周六");
    }
    else if (sender.tag == 1006)
    {
        NSLog(@"周日");
    }
}

//发布
- (void)fabuBtnOnClick:(UIButton*)sender
{
    NSLog(@"发布");
}

- (void)createUI
{
    infoTablView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(SV.frame)+10, screenWidth, screenHeight-64-60) style:UITableViewStylePlain];
    infoTablView.delegate = self;
    infoTablView.dataSource = self;
    infoTablView.backgroundColor = kBackgroundColor;
    infoTablView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:infoTablView];
    
    
    UILabel * lineLabel = [[UILabel alloc] init];
    lineLabel.backgroundColor = KFontColorE;
    lineLabel.frame = CGRectMake(0, screenHeight- 60.5, screenWidth, 0.5);
    [self.view addSubview:lineLabel];
    
    fabuBtn = [[UIButton alloc] init];
    fabuBtn.frame = CGRectMake(0, screenHeight- 60, screenWidth, 60);
    [fabuBtn setTitle:@"发布" forState:UIControlStateNormal];
    [fabuBtn setTitleColor:KFontColorC forState:UIControlStateNormal];
    fabuBtn.backgroundColor = KFontColorA;
    fabuBtn.titleLabel.font = NormalFontWithSize(15);
    [fabuBtn addTarget:self action:@selector(fabuBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fabuBtn];
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 40)];
    view.backgroundColor = KFontColorA;
    
    UILabel * firstLabel = [[UILabel alloc] init];
    firstLabel.frame = CGRectMake(30, 0, 60, 40);
    firstLabel.textAlignment = NSTextAlignmentLeft;
    firstLabel.textColor = KFontColorB;
    if(section == 0)
    {
        firstLabel.text = @"上午";
    }
    else if (section == 1)
    {
        firstLabel.text = @"下午";
    }
    firstLabel.font = NormalFontWithSize(14);
    [view addSubview:firstLabel];
    
    UILabel * secondLabel = [[UILabel alloc] init];
    secondLabel.frame = CGRectMake(screenWidth/2-40, 0, 60, 40);
    secondLabel.textAlignment = NSTextAlignmentLeft;
    secondLabel.textColor = KFontColorB;
    secondLabel.text = @"课程";
    secondLabel.font = NormalFontWithSize(14);
    [view addSubview:secondLabel];
    
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return classOneArr.count+1;
    }
    else
    {
        return classTwoArr.count+1;;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"Cources";
    
    CoursesCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[CoursesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    cell.section = indexPath.section;

    if (indexPath.section == 0)
    {
        cell.addClassBtn.tag = indexPath.section;
        cell.editClassBtn.tag = indexPath.row;

        if (classOneArr.count>0)
        {
            if (indexPath.row<classOneArr.count)
            {
                cell.numLabel.hidden = NO;
                cell.classNameLabel.hidden = NO;
                cell.editClassBtn.hidden = NO;
                cell.deleteBtn.hidden = NO;
                cell.deleteBtn.tag = indexPath.row;
                
                cell.addClassBtn.hidden = YES;
                cell.numLabel.text = [NSString stringWithFormat:@"第%ld节课",(long)indexPath.row+1];
                cell.classNameLabel.text = [NSString stringWithFormat:@"     %@",[classOneArr objectAtIndex:indexPath.row]];
            }
            else
            {
                cell.numLabel.hidden = YES;
                cell.classNameLabel.hidden = YES;
                cell.editClassBtn.hidden = YES;
                cell.deleteBtn.hidden = YES;
                cell.addClassBtn.hidden = NO;
            }
        }
        else
        {
            cell.numLabel.hidden = YES;
            cell.classNameLabel.hidden = YES;
            cell.editClassBtn.hidden = YES;
            cell.deleteBtn.hidden = YES;
            cell.addClassBtn.hidden = NO;
        }
    }
    else if (indexPath.section == 1)
    {
        cell.addClassBtn.tag = indexPath.section;
        cell.editClassBtn.tag = indexPath.row;
        if (classTwoArr.count>0)
        {
            if (indexPath.row <classTwoArr.count)
            {
                cell.numLabel.hidden = NO;
                cell.classNameLabel.hidden = NO;
                cell.editClassBtn.hidden = NO;
                cell.deleteBtn.hidden = NO;
                cell.addClassBtn.hidden = YES;
                
                cell.deleteBtn.tag = indexPath.row;
                cell.numLabel.text = [NSString stringWithFormat:@"第%ld节课",(long)indexPath.row+classOneArr.count+1];
                cell.classNameLabel.text = [NSString stringWithFormat:@"     %@",[classTwoArr objectAtIndex:indexPath.row]];
            }
            else
            {
                cell.numLabel.hidden = YES;
                cell.classNameLabel.hidden = YES;
                cell.editClassBtn.hidden = YES;
                cell.deleteBtn.hidden = YES;
                cell.addClassBtn.hidden = NO;
            }
        }
        else
        {
            cell.numLabel.hidden = YES;
            cell.classNameLabel.hidden = YES;
            cell.editClassBtn.hidden = YES;
            cell.deleteBtn.hidden =YES;
            cell.addClassBtn.hidden = NO;
        }
    }
    
    return cell;
}

//添加课程
- (void)addClassWithIndex:(NSInteger)index
{
    if (index == 0)
    {
        [classOneArr addObject:@""];
    }
    else if (index == 1)
    {
        [classTwoArr addObject:@""];
    }
    [infoTablView reloadData];
}

#pragma mark ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓封装编辑视图↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

- (void)createEditView
{
    if (!mainTwoView)
    {
        mainTwoView = [[UIView alloc] init];
    }
    mainTwoView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    mainTwoView.backgroundColor = [KFontColorC colorWithAlphaComponent:0.3];
    [self.view addSubview:mainTwoView];
    
    if (!hideTwoBtn)
    {
        hideTwoBtn = [[UIButton alloc] init];
    }
    hideTwoBtn.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    hideTwoBtn.backgroundColor = [UIColor clearColor];
    [hideTwoBtn addTarget:self action:@selector(hideTwoBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [mainTwoView addSubview:hideTwoBtn];
    
    if (!editView)
    {
        editView = [[UIView alloc] init];
    }
    editView.backgroundColor = KFontColorA;
    editView.layer.cornerRadius = 8;
    editView.clipsToBounds = YES;
    editView.layer.masksToBounds = YES;
    editView.frame = CGRectMake((screenWidth-270)/2, 200, 270, 150);
    [mainTwoView addSubview:editView];
    
    if (!editTF)
    {
        editTF = [[UITextField alloc] init];
    }
    editTF.frame = CGRectMake(20, 30, 230, 45);
    editTF.textColor = KFontColorC;
    editTF.backgroundColor = KFontColorA;
    editTF.layer.borderWidth = 0.7f;
    editTF.layer.borderColor = KFontColorE.CGColor;
    editTF.delegate = self;
    editTF.text = @"";
    editTF.returnKeyType = UIReturnKeyDone;
    [editView addSubview:editTF];
    
    if (!lineTwoLabel)
    {
        lineTwoLabel = [[UILabel alloc] init];
    }
    lineTwoLabel.backgroundColor = KFontColorE;
    lineTwoLabel.frame = CGRectMake(0, CGRectGetMaxY(editTF.frame)+30, CGRectGetWidth(editView.frame), 0.5);
    [editView addSubview:lineTwoLabel];
    
    if (!sureBtn)
    {
        sureBtn = [[UIButton alloc] init];
    }
    sureBtn.titleLabel.font = NormalFontWithSize(15);
    sureBtn.frame = CGRectMake(0, CGRectGetMaxY(lineTwoLabel.frame), CGRectGetWidth(editView.frame), 44);
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:KFontColorC forState:UIControlStateNormal];
    [sureBtn setBackgroundImage:[KFontColorA image] forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sureBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [editView addSubview:sureBtn];
    
    mainTwoView.hidden = YES;
}

- (void)hideTwoBtnOnClick:(UIButton*)sender
{
    mainTwoView.hidden = YES;
    [editTF resignFirstResponder];
}

- (void)sureBtnOnClick:(UIButton*)sender
{
    if (recordSection == 0)
    {
        [classOneArr replaceObjectAtIndex:recordRow withObject:editTF.text];
    }
    else
    {
        [classTwoArr replaceObjectAtIndex:recordRow withObject:editTF.text];
    }
    
    mainTwoView.hidden = YES;
    editTF.text = @"";
    
    [infoTablView reloadData];
}

#pragma mark ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑封装编辑视图↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

//编辑课程
- (void)editClassWithIndex:(UIButton *)sender WithSection:(NSInteger)section
{
    recordRow = sender.tag;
    recordSection = section;
    mainTwoView.hidden = NO;
    [editTF becomeFirstResponder];
    
    if (section == 0)
    {
        if ([classOneArr objectAtIndex:sender.tag])
        {
            editTF.text = [classOneArr objectAtIndex:sender.tag];
        }
        else
        {
            editTF.text = @"";
        }
    }
    else
    {
        if ([classTwoArr objectAtIndex:sender.tag])
        {
            editTF.text = [classTwoArr objectAtIndex:sender.tag];
        }
        else
        {
            editTF.text = @"";
        }
    }
        
    [infoTablView reloadData];
}

- (void)deleteWithIndex:(UIButton *)sender WithSection:(NSInteger)section
{
    recordRow = sender.tag;
    recordSection = section;
    
    if (section == 0)
    {
        [classOneArr removeObjectAtIndex:sender.tag];
    }
    else
    {
        [classTwoArr removeObjectAtIndex:sender.tag];
    }
    
    [infoTablView reloadData];
}

//重写返回，弹出列表选择是否退出
- (void)back
{
    NSLog(@"走起");
    UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"保存草稿",@"退出编辑",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        if (self.navigationController && self.navigationController.viewControllers.count>1)
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

// 点击页面，输入框失去焦点
- (void)viewTapped:(UITapGestureRecognizer*)ges
{
    if([editTF isFirstResponder])
    {
        [editTF resignFirstResponder];
    }
}

@end
