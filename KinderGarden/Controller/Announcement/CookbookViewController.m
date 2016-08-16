//
//  CookbookViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/8/16.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "CookbookViewController.h"

@interface CookbookViewController ()

@end

@implementation CookbookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kBackgroundColor;
    
    [headerView loadComponentsWithTitle:@"" withTitleColor:KFontColorA];
    [headerView backButton];
    
    mealArr = [[NSMutableArray alloc] initWithCapacity:10];
    classNum = 0;
    recordRow = 0;
    
    [self createClassBtn];
    [self createScrollView];
    [self createUI];
}

- (void)createClassBtn
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
    NSArray * arr = @[@"大一班",@"大二班",@"大三班",@"中一班",@"中二班",@"中三班",@"小一班",@"小二班",@"小三班"];
    [self deliverArray:arr];
}

//将班级信息传给选择视图
- (void)deliverArray:(NSArray*)arr
{
    selectView = [[SelectClssView defaultSelectClssView] initWithArray:arr withDelegate:self];
    selectView.delegate = self;
    [selectView showView];
}

#pragma mark 选择班级模块代理方法
//选择完成
- (void)finishClick:(NSString *)title
{
    [selectView hideView];
    
    //先清空headerView上的label，在显示新信息
    if (headerView)
    {
        for (UIView * view in headerView.subviews)
        {
            if ([view isKindOfClass:[UILabel class]])
            {
                [view removeFromSuperview];
            }
        }
    }
    
    [headerView loadComponentsWithTitle:title withTitleColor:KFontColorA];
}

//隐藏选择班级
- (void)hideClicked
{
    [selectView hideView];
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

//选择星期
- (void)dayBtnOnClick:(UIButton*)sender
{
    switch (sender.tag)
    {
        case 1000:
            NSLog(@"周一");
            break;
        case 1001:
            NSLog(@"周二");
            break;
        case 1002:
            NSLog(@"周三");
            break;
        case 1003:
            NSLog(@"周四");
            break;
        case 1004:
            NSLog(@"周五");
            break;
        case 1005:
            NSLog(@"周六");
            break;
        case 1006:
            NSLog(@"周日");
            break;
            
        default:
            break;
    }
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

//发布
- (void)fabuBtnOnClick:(UIButton*)sender
{
    NSLog(@"发布");
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 40)];
    view.backgroundColor = KFontColorA;
    
    UILabel * firstLabel = [[UILabel alloc] init];
    firstLabel.frame = CGRectMake(30, 0, 60, 40);
    firstLabel.textAlignment = NSTextAlignmentLeft;
    firstLabel.textColor = KFontColorB;
    firstLabel.text = @"餐次";
    firstLabel.font = NormalFontWithSize(14);
    [view addSubview:firstLabel];
    
    UILabel * secondLabel = [[UILabel alloc] init];
    secondLabel.frame = CGRectMake(screenWidth/2-40, 0, 60, 40);
    secondLabel.textAlignment = NSTextAlignmentLeft;
    secondLabel.textColor = KFontColorB;
    secondLabel.text = @"食物";
    secondLabel.font = NormalFontWithSize(14);
    [view addSubview:secondLabel];
    
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110.f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mealArr.count+1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"CookbookID";
    
    CookbookCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[CookbookCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;

    cell.addMealBtn.tag = indexPath.section;
    

    if (mealArr.count>0)
    {
        if (indexPath.row<mealArr.count)
        {
            cell.MealTimeLabel.hidden = NO;
            cell.deleteBtn.hidden = NO;
            cell.deleteBtn.tag = indexPath.row;
            cell.containerScrollView.hidden = NO;
            cell.addMealBtn.hidden = YES;

            NSInteger row = indexPath.row;
            NSString * dinner =@"";
            switch (row)
            {
                case 0:
                    dinner = @"早餐";
                    break;
                case 1:
                    dinner = @"午餐";
                    break;
                case 2:
                    dinner = @"晚餐";
                    break;
                case 3:
                    dinner = @"夜宵";
                    break;
                default:
                    break;
            }
            
            cell.MealTimeLabel.text = dinner;
        }
        else
        {
            cell.MealTimeLabel.hidden = YES;
            cell.deleteBtn.hidden = YES;
            cell.addMealBtn.hidden = NO;
            cell.containerScrollView.hidden = YES;
        }
    }
    else
    {
        cell.MealTimeLabel.hidden = YES;
        cell.deleteBtn.hidden = YES;
        cell.addMealBtn.hidden = NO;
        cell.containerScrollView.hidden = YES;
    }
    
    return cell;
}

- (void)addMealWithIndex:(NSInteger)index
{
    [mealArr addObject:@""];
 
    [infoTablView reloadData];
}

- (void)deleteMealWithIndex:(UIButton *)sender
{
    recordRow = sender.tag;
    [mealArr removeObjectAtIndex:recordRow];
    
    [infoTablView reloadData];
}


//重写返回，弹出列表选择是否退出
- (void)back
{
    UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:@"是否退出编辑" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"继续编辑",@"退出编辑",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)
    {
        //保存草稿
    }
    else if (buttonIndex == 1)
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

@end
