//
//  CoursesViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/6/28.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "CoursesViewController.h"

#import "CourseRequest.h"

@interface CoursesViewController ()

@end

@implementation CoursesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kBackgroundColor;
    
    [headerView loadComponentsWithTitle:@"" withTitleColor:KFontColorA];
    [headerView backButton];
    
    classOneArr = [[NSMutableArray alloc] initWithCapacity:10];
    classTwoArr = [[NSMutableArray alloc] initWithCapacity:10];
    classNum = 0;
    recordSection = 0;
    recordRow = 0;
    
    [self createClassBtn];
    [self createScrollView];
    [self createUI];
    [self createEditView];
    
    if (self.canEdit == NO)
    {
        [CourseRequest requestCourseListWithRows:20 page:1 weeknum:@"" festivals:@"" course:@"" clssids:@"" delegate:self];
    }
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

- (void)createEditView
{
    editV = [[EditView defaultEditView] init];
    editV.delegate  =self;
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
        [dayBtn setBackgroundImage:[[UIColor lightGrayColor] image] forState:UIControlStateNormal];
        [dayBtn addTarget:self action:@selector(dayBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [SV addSubview:dayBtn];
    }
}

//选择星期
- (void)dayBtnOnClick:(UIButton*)sender
{
    for (UIView * view in SV.subviews)
    {
        if ([view isKindOfClass:[UIButton class]])
        {
            UIButton * btn = (UIButton *)view;
            [btn setBackgroundImage:[[UIColor lightGrayColor] image] forState:UIControlStateNormal];
        }
    }
    [sender setBackgroundImage:[KPurpleColor image] forState:UIControlStateNormal];
    switch (sender.tag)
    {
        case 1000:
            selectedWeek = @"周一";
            break;
        case 1001:
            selectedWeek = @"周二";
            break;
        case 1002:
            selectedWeek = @"周三";
            break;
        case 1003:
            selectedWeek = @"周四";
            break;
        case 1004:
            selectedWeek = @"周五";
            break;
        case 1005:
            selectedWeek = @"周六";
            break;
        case 1006:
            selectedWeek = @"周日";
            break;
      
        default:
            break;
    }
}

- (void)createUI
{
    infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(SV.frame)+10, screenWidth, screenHeight-64-60) style:UITableViewStylePlain];
    infoTableView.delegate = self;
    infoTableView.dataSource = self;
    infoTableView.backgroundColor = kBackgroundColor;
    infoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:infoTableView];
    
    if (self.canEdit)
    {
        
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
}

//发布
- (void)fabuBtnOnClick:(UIButton*)sender
{
    NSMutableArray * classIDs = [NSMutableArray array];
    [classIDs addObject:@"1"];
    [classIDs addObject:@"2"];
    [CourseRequest addOneCourseWithWeekNumber:selectedWeek.length?selectedWeek:@"周一" courseTime:@"1,2,3" course:@"语文,英语,数学" classIDs:classIDs operateID:[GFStaticData getObjectForKey:kTagUserKeyID] delegate:self];
}

- (void)nxRequestFinished:(NXBaseRequest *)request
{
    NSLog(@"request.back is %@",request.attributeDic);
    if (self.canEdit && [request.vrCodeString isEqualToString:kTagAddOneCourseRequest])
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"发布课程成功"];
    }
    else if ([request.vrCodeString isEqualToString:kRequestTagGetCourseList])
    {
        infoArray = [NSMutableArray arrayWithArray:[request.attributeDic objectForKey:@"obj"]];
        [infoTableView reloadData];
    }
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
    if (self.canEdit == NO)
    {
        firstLabel.text = @"";
    }
    
    UILabel * secondLabel = [[UILabel alloc] init];
    secondLabel.frame = CGRectMake(screenWidth/2-40, 0, 60, 40);
    secondLabel.textAlignment = NSTextAlignmentLeft;
    secondLabel.textColor = KFontColorB;
    secondLabel.text = @"课程";
    secondLabel.font = NormalFontWithSize(14);
    [view addSubview:secondLabel];
    
    if (self.canEdit == NO)
    {
        secondLabel.text = @"课程列表";
    }
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
    if (self.canEdit)
        return 2;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.canEdit)
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
    return infoArray.count;
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
    
    if (self.canEdit)
    {
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
                cell.deleteBtn.hidden = YES;
                cell.addClassBtn.hidden = NO;
            }
        }
    }
    else
    {
        NSDictionary * courseInfo = [infoArray objectAtIndex:indexPath.row];
        cell.numLabel.hidden = YES;
        cell.classNameLabel.hidden = NO;
        cell.classNameLabel.text = [NXGlobalUtil checkNullData:courseInfo key:@"course"];
        cell.editClassBtn.hidden = NO;
        cell.deleteBtn.hidden = YES;
        cell.addClassBtn.hidden = YES;
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
    [infoTableView reloadData];
}

//删除课程
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
    
    [infoTableView reloadData];
}

//编辑课程
- (void)editClassWithIndex:(UIButton *)sender WithSection:(NSInteger)section
{
    if (self.canEdit)
    {
        recordRow = sender.tag;
        recordSection = section;
        
        NSString * title=@"";
        if (section == 0)
        {
            if ([classOneArr objectAtIndex:sender.tag])
            {
                title = [classOneArr objectAtIndex:sender.tag];
            }
        }
        else
        {
            if ([classTwoArr objectAtIndex:sender.tag])
            {
                title = [classTwoArr objectAtIndex:sender.tag];
            }
        }
        
        [editV setTitleStr:title];
        [editV showView];
    }

    [infoTableView reloadData];
}

#pragma mark 编辑弹窗代理方法
//隐藏弹窗
- (void)hideBtnClicked
{
    [editV hideView];
}

//确定输入内容
- (void)sureClick:(NSString *)title
{
    [editV hideView];
    
    if (title.length>0)
    {
        if (recordSection == 0)
        {
            [classOneArr replaceObjectAtIndex:recordRow withObject:title];
        }
        else
        {
            [classTwoArr replaceObjectAtIndex:recordRow withObject:title];
        }
    }
    [infoTableView reloadData];
}

//重写返回，弹出列表选择是否退出
- (void)back
{
    if (self.canEdit)
    {
        UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:@"是否退出编辑" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"继续编辑",@"退出编辑",nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
        [actionSheet showInView:self.view];
    }
    else
    {
        [super back];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)
    {
        //继续编辑
    }
    else if (buttonIndex == 1)
    {    
        [super back];
    }
}

@end
