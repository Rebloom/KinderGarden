//
//  ChildDetailViewController.m
//  KinderGarden
//
//  Created by haonanchen on 16/6/11.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "ChildDetailViewController.h"

#import "BabyRequest.h"

@interface ChildDetailViewController ()

@end

@implementation ChildDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [headerView loadComponentsWithTitle:@"宝宝详情"];
    [headerView backButton];
    
    infoArray = [NSMutableArray arrayWithCapacity:20];
    
    infoTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    infoTable.delegate = self;
    infoTable.dataSource = self;
    [self.view addSubview:infoTable];
    
    descString = @"姓名,昵称,性别,出生日期,年龄;入校时间,是否在校";
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [descString componentsSeparatedByString:@";"].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString * rowString = [[descString componentsSeparatedByString:@";"] objectAtIndex:section];
    
    return [rowString componentsSeparatedByString:@","].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 180;
    }
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 30)];
    
    if (section == 0)
    {
        if (bgImageView == nil)
        {
            bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 180)];
            [bgImageView sd_setImageWithURL:[NSURL URLWithString:@"http://pic1.win4000.com/wallpaper/9/542a4a04d2ab3.jpg"]];
        }
        
        UIImageView * headerIcon = [[UIImageView alloc] initWithFrame:CGRectMake((screenWidth-60)/2, 40, 60, 60)];
        [headerIcon sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"icon_child"]];
        [bgImageView addSubview:headerIcon];
        
        UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerIcon.frame)+10, screenWidth, 20)];
        nameLabel.backgroundColor = [UIColor clearColor];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.font = NormalFontWithSize(16);
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.text = @"点击上传宝宝艺术照";
        [bgImageView addSubview:nameLabel];
        
        UIButton * btn = [[UIButton alloc] initWithFrame:bgImageView.frame];
        [btn addTarget:self action:@selector(sectionHeaderClicked:) forControlEvents:UIControlEventTouchUpInside];
        [bgImageView addSubview:btn];
        
        return bgImageView;
    }
    else
    {
        UILabel * sectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, screenWidth, 30)];
        sectionLabel.backgroundColor = [UIColor clearColor];
        sectionLabel.font = NormalFontWithSize(14);
        sectionLabel.textColor = [UIColor lightGrayColor];
        if (section == 1)
        {
            sectionLabel.text = @"家庭关系";
        }
        [view addSubview:sectionLabel];
    }
    
    return view;
}

- (void)sectionHeaderClicked:(id)sender
{
    [takePhoto show];
}

- (void)didSelectImage:(UIImage *)image
{
    bgImageView.image = image;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    
    NSString * desc = [[descString componentsSeparatedByString:@";"] objectAtIndex:indexPath.section];
    desc = [[desc componentsSeparatedByString:@","] objectAtIndex:indexPath.row];
    
    UILabel * descLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-10, 60)];
    descLabel.backgroundColor = [UIColor clearColor];
    descLabel.font = NormalFontWithSize(15);
    descLabel.textColor = [UIColor blackColor];
    descLabel.text = desc;
    [cell addSubview:descLabel];
    
    UIImageView * rightImageView = [[UIImageView alloc] init];
    rightImageView.image = [UIImage imageNamed:@"right"];
    rightImageView.frame = CGRectMake(screenWidth - 20.5, 15, 8.5, 15);
    [cell addSubview:rightImageView];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [BabyRequest insertBabyInfoWithAge:4 bgUrl:@"32" birthday:@"2012-12-12" iconUrl:@"32" schoolTime:@"2016-11-11 00:00:00" inSchool:@"1" nickName:@"明明" sex:@"1" username:@"baobao" delegate:self];
}

- (void)nxRequestFinished:(NXBaseRequest *)request
{
    NSLog(@"request.attric is %@",request.attributeDic);
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sectionHeaderHeight = 180;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
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
