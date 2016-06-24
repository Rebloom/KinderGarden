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

@interface EditDataViewController ()
{
    BOOL         _isShow;
    UIView      *_chooseCityView;
}
@property (nonatomic, strong) YWBCityPickerView *cityPickerView;

@end

@implementation EditDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [headerView loadComponentsWithTitle:@"完善资料" withTitleColor:KFontColorA];
    [headerView backButton];
    _isShow = NO;
    rightOneArr = [[NSMutableArray alloc] initWithCapacity:10];
    NSArray * onerightOneArr = @[@"",@"半杯咖啡@jing",@"123347@qq.com",@"",@"女"];
    rightOneArr = [onerightOneArr mutableCopy];
    
    [self createUI];
    [self createPickerView];
}

- (void)createUI
{
    infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64) style:UITableViewStylePlain];
    infoTableView.delegate = self;
    infoTableView.dataSource = self;
    infoTableView.backgroundColor = kBackgroundColor;
    infoTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:infoTableView];
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 20)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 5;
    }
    else
        return 4;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    EditDataCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[EditDataCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSArray * oneTitleArr = @[@"头像",@"昵称",@"账号",@"地区",@"性别"];
    NSArray * twoTitleArr = @[@"家庭角色",@"宝宝名字",@"宝宝性别",@"宝宝年龄"];
    
    NSArray * tworightOneArr = @[@"妈妈",@"李明泽",@"男",@"4岁"];
    
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            cell.photoImageView.hidden = NO;
        }
        else
        {
            cell.photoImageView.hidden = YES;
        }
        cell.nameLabel.text = [oneTitleArr objectAtIndex:indexPath.row];
        cell.rightLabel.text = [rightOneArr objectAtIndex:indexPath.row];
    }
    else
    {
        cell.photoImageView.hidden = YES;

        cell.nameLabel.text = [twoTitleArr objectAtIndex:indexPath.row];
        cell.rightLabel.text = [tworightOneArr objectAtIndex:indexPath.row];
    }

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0)
    {
        if (indexPath.row == 3)
        {
            [self pickerviewbuttonclick:nil];
        }
    }
    else
    {
        
    }
}

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
        [rightOneArr replaceObjectAtIndex:3 withObject:cityStr];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
