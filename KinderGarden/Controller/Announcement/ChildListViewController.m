//
//  ChildListViewController.m
//  KinderGarden
//
//  Created by haonanchen on 16/6/11.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "ChildListViewController.h"

#import "BabyRequest.h"

@interface ChildListViewController ()

@end

@implementation ChildListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [headerView loadComponentsWithTitle:@"宝宝档案"];
    [headerView backButton];
    
    childArray = [NSMutableArray arrayWithCapacity:20];
    
    infoTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    infoTable.delegate = self;
    infoTable.dataSource = self;
    [self.view addSubview:infoTable];
    
    selectedIndex = -1;

    [self getChildList];
    // Do any additional setup after loading the view.
}

- (void)getChildList
{
    [BabyRequest requestBabyListWithPage:0 rows:20 delegate:self];
}

- (void)nxRequestFinished:(NXBaseRequest *)request
{
    NSLog(@"request.back is %@",request.attributeDic);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return childArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (selectedIndex == indexPath.row)
    {
        return 140;
    }
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary * dic = [childArray objectAtIndex:indexPath.row];
    
    UIImageView * childIcon = [[UIImageView alloc] initWithFrame:CGRectMake(15, 7.5, 45, 45)];
    [childIcon sd_setImageWithURL:[NSURL URLWithString:[NXGlobalUtil checkNullData:dic key:@"iocurl"]] placeholderImage:[UIImage imageNamed:@"icon_child"]];
    [cell addSubview:childIcon];
    
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(childIcon.frame)+5, 0, SCREEN_WIDTH-10, 60)];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.font = NormalFontWithSize(15);
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = [childArray objectAtIndex:indexPath.row];
    [cell addSubview:nameLabel];
    
    UIImageView * rightImageView = [[UIImageView alloc] init];
    rightImageView.image = [UIImage imageNamed:@"right"];
    rightImageView.frame = CGRectMake(screenWidth - 20.5, 15, 8.5, 15);
    if (selectedIndex == indexPath.row)
    {
        rightImageView.image = [UIImage imageNamed:@"icon_arrow_down"];
    }
    [cell addSubview:rightImageView];
    
    if (selectedIndex == indexPath.row)
    {
        NSArray * nameArray = @[@"聊天",@"成长档案",@"宝宝详情",@"请假"];
        NSArray * iconArray = @[@"icon_baby_chat",@"icon_baby_archive",@"icon_child",@"icon_leave"];
        
        for (int i = 0; i < nameArray.count; i++)
        {
            UIView * container = [[UIView alloc] initWithFrame:CGRectMake(screenWidth/nameArray.count*i, 60, screenWidth/nameArray.count, 80)];
            container.userInteractionEnabled = YES;
            
            UIImageView * iconImage = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(container.frame)-30)/2, 17, 30, 30)];
            iconImage.image = [UIImage imageNamed:[iconArray objectAtIndex:i]];
            [container addSubview:iconImage];
            
            UILabel * menuName = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(iconImage.frame)+5, CGRectGetWidth(container.frame), 12)];
            menuName.textAlignment = NSTextAlignmentCenter;
            menuName.backgroundColor = [UIColor clearColor];
            menuName.font = NormalFontWithSize(12);
            menuName.textColor = @"#666666".color;
            menuName.text = [nameArray objectAtIndex:i];
            [container addSubview:menuName];
            
            [cell addSubview:container];
            
            UIButton * btn = [[UIButton alloc] initWithFrame:container.frame];
            [btn addTarget:self action:@selector(menuBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = i;
            [cell addSubview:btn];
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    selectedIndex = indexPath.row;
    
    [infoTable reloadData];
}

- (void)menuBtnClicked:(id)sender
{
    UIButton * btn = (UIButton *)sender;
    if (selectedIndex != -1)
    {
        if (btn.tag == 2)
        {
            ChildDetailViewController * CDVC = [[ChildDetailViewController alloc] init];
            [self pushToViewController:CDVC];
        }
        NSString * alertMsg = [NSString stringWithFormat:@"点击了第%ld行的%ld个菜单",selectedIndex+1,btn.tag+1];
        [[TKAlertCenter defaultCenter] postAlertWithMessage:alertMsg];
    }
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
