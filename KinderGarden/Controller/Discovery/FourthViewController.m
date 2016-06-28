//
//  FourthViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "FourthViewController.h"
#import "ParentsChatViewController.h"

#import "AttentionAndFunsViewController.h"
#import "LookViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [headerView loadComponentsWithTitle:@"发现" withTitleColor:KFontColorA];
    
    [self createTableView];
    
}

- (void)createTableView
{
    infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight) style:UITableViewStylePlain];
    infoTableView.delegate = self;
    infoTableView.dataSource = self;
    infoTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:infoTableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell ==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
//    NSArray * leftArr= @[@"父母圈",@"待定",@"待定"];
    NSArray * leftArr= @[@"父母圈"];

    UILabel * leftLable = [[UILabel alloc] init];
    leftLable.textAlignment = NSTextAlignmentLeft;
    leftLable.frame = CGRectMake(20, 0, 100, 60);
    leftLable.font = NormalFontWithSize(14);
    leftLable.textColor = KFontColorC;
    leftLable.text = [leftArr objectAtIndex:indexPath.row];
    [cell addSubview:leftLable];
    
    UILabel * lineLabel = [[UILabel alloc] init];
    lineLabel.backgroundColor = KFontColorE;
    lineLabel.frame = CGRectMake(0, 59.5, screenWidth, 0.5);
    [cell addSubview:lineLabel];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0)
    {
        ParentsChatViewController * PCVC = [[ParentsChatViewController alloc] init];
        [self pushToViewController:PCVC];
    }
    else if (indexPath.row == 1)
    {
#warning 测试用
//        AttentionAndFunsViewController * AAFVC = [[AttentionAndFunsViewController alloc] init];
//        [self pushToViewController:AAFVC];
    }
    else if (indexPath.row == 2)
    {
#warning 测试用
//        LookViewController * LVC = [[LookViewController alloc] init];
//        [self pushToViewController:LVC];
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
