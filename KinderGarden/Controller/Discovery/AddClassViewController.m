//
//  AddClassViewController.m
//  KinderGarden
//
//  Created by haonanchen on 16/9/24.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "AddClassViewController.h"

#import "ClassRequest.h"

@interface AddClassViewController ()

@end

@implementation AddClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [headerView loadComponentsWithTitle:@"加入班级"];
    [headerView backButton];
    
    infoArray = [NSMutableArray arrayWithCapacity:20];
    [infoArray addObject:@"选择学校"];
    [infoArray addObject:@"选择班级"];
    [infoArray addObject:@"选择班主任"];
    [infoArray addObject:@"添加教师"];
    [infoArray addObject:@"提交"];
    
    infoTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    infoTable.delegate = self;
    infoTable.dataSource = self;
    [self.view addSubview:infoTable];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return infoArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 45)];
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 45)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = NormalFontWithSize(15);
    titleLabel.text = [infoArray objectAtIndex:indexPath.row];
    [cell addSubview:titleLabel];
    
    if (indexPath.row == 4)
    {
        titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row < 4)
    {
        UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
        for (UIView * view in cell.subviews)
        {
            if ([view isKindOfClass:[UILabel class]])
            {
                UILabel * label = (UILabel *)view;
                NSString * appendingString = @"";
                if (indexPath.row == 0)
                {
                    appendingString = @"北京实验幼小";
                }
                else if (indexPath.row == 1)
                {
                    appendingString = @"大班";
                }
                else if (indexPath.row == 2)
                {
                    appendingString = @"班主任测试";
                }
                else if (indexPath.row == 3)
                {
                    appendingString = @"教师1,2,3";
                }
                label.text = [label.text stringByAppendingString:[NSString stringWithFormat:@": %@",appendingString]];
            }
        }
    }
    else
    {
        [ClassRequest addOneClassWithSchoolID:@"1" className:@"大班" chiefTeacherID:@"1" teacherIDs:@"1,2,3" delegate:self];
    }
}

- (void)nxRequestFinished:(NXBaseRequest *)request
{
    if ([[request.attributeDic objectForKey:@"success"] integerValue])
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"添加班级成功"];
        [self performSelector:@selector(back) withObject:nil afterDelay:1.5];
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
