//
//  SecondViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "SecondViewController.h"
#import "NewsDetailViewController.h"

#import "PublicRequest.h"

#define Announce    @"Announce"
#define BabyShow    @"babyshow"
#define School      @"school"
#define Class       @"class"
#define Tips        @"tips"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

- (void)createTopView
{
    if (!announceBtn)
    {
        announceBtn = [[UIButton alloc] init];
    }
    announceBtn.tag = 2000;
    announceBtn.frame = CGRectMake(screenWidth/2-100, 20, 100, 44);
    announceBtn.titleLabel.font = MediumSTFontWithSize(18);
    [announceBtn setTitle:@"公告栏" forState:UIControlStateNormal];
    [announceBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
    [announceBtn addTarget:self action:@selector(headerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:announceBtn];
    
    if (!babyShowBtn)
    {
        babyShowBtn = [[UIButton alloc] init];
    }
    babyShowBtn.tag = 2001;
    babyShowBtn.frame = CGRectMake(CGRectGetMaxX(announceBtn.frame), 20, 100, 44);
    babyShowBtn.titleLabel.font = MediumSTFontWithSize(18);
    [babyShowBtn setTitle:@"宝宝秀" forState:UIControlStateNormal];
    [babyShowBtn setTitleColor:@"#5450a0".color forState:UIControlStateNormal];
    [babyShowBtn addTarget:self action:@selector(headerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:babyShowBtn];
    
    UIImageView *indicatorLabel= [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(announceBtn.frame), CGRectGetMaxY(announceBtn.frame)-4, CGRectGetWidth(announceBtn.frame), 4)];
    indicatorLabel.backgroundColor = KFontColorA;
    indicatorLabel.tag = 250;
    [headerView addSubview:indicatorLabel];
    
    UIImageView * shaixuanImageView = [[UIImageView alloc] init];
    shaixuanImageView.image = [UIImage imageNamed:@"shaixuan"];
    shaixuanImageView.frame = CGRectMake(screenWidth-15-23, 30, 23, 22);
    [headerView addSubview:shaixuanImageView];
    
    UIButton * shaixuanBtn = [[UIButton alloc] init];
    shaixuanBtn.backgroundColor = [UIColor clearColor];
    [shaixuanBtn setFrame:CGRectMake(screenWidth-15-23-10, 20, 43, 40)];
    [shaixuanBtn addTarget:self action:@selector(shaixuanBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:shaixuanBtn];
}

//筛选
- (void)shaixuanBtnOnClick:(UIButton*)sender
{
    NSLog(@"筛选");
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [headerView setBackgroundColor:KPurpleColor];
    
    infoArray = [NSMutableArray arrayWithCapacity:10];
    
    [self getPublicInfo];
    
    statusFlag = Announce;
    announceFlag = School;
    
    [self createTopView];
    [self createBanner];
    [self createTableView];
}

- (void)getPublicInfo
{
    [PublicRequest getPublicListWithPage:@"2" numbers:@"20" delegate:self];
}

- (void)nxRequestFinished:(NXBaseRequest *)request
{
    infoArray = [request.attributeDic objectForKey:@"obj"];
    [infoTableView reloadData];
}

- (void)createBanner
{
    if(!headView)
    {
        headView = [[UIView alloc] init];
    }
    headView.frame = CGRectMake(0, 64, screenHeight, 45);
    headView.backgroundColor = @"#e6e5ff".color;
    [self.view addSubview:headView];
    
    if (!schoolBtn)
    {
        schoolBtn = [[UIButton alloc] init];
    }
    schoolBtn.tag = 2002;
    schoolBtn.frame = CGRectMake((screenWidth-240)/2, 0, 80, 45);
    schoolBtn.titleLabel.font = NormalFontWithSize(16);
    [schoolBtn setTitle:@"学校" forState:UIControlStateNormal];
    [schoolBtn setTitleColor:@"#7974ea".color forState:UIControlStateNormal];
    [schoolBtn addTarget:self action:@selector(headViewClicked:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:schoolBtn];
    
    if (!classBtn)
    {
        classBtn = [[UIButton alloc] init];
    }
    classBtn.tag = 2003;
    classBtn.frame = CGRectMake(CGRectGetMaxX(schoolBtn.frame), CGRectGetMinY(schoolBtn.frame), CGRectGetWidth(schoolBtn.frame), CGRectGetHeight(schoolBtn.frame));
    classBtn.titleLabel.font = NormalFontWithSize(16);
    [classBtn setTitle:@"班级" forState:UIControlStateNormal];
    [classBtn setTitleColor:@"#9a98c1".color forState:UIControlStateNormal];
    [classBtn addTarget:self action:@selector(headViewClicked:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:classBtn];
    
    if (!tipBtn)
    {
        tipBtn = [[UIButton alloc] init];
    }
    tipBtn.tag = 2004;
    tipBtn.frame = CGRectMake(CGRectGetMaxX(classBtn.frame), CGRectGetMinY(classBtn.frame), CGRectGetWidth(classBtn.frame), CGRectGetHeight(classBtn.frame));
    tipBtn.titleLabel.font = NormalFontWithSize(16);
    [tipBtn setTitle:@"小贴士" forState:UIControlStateNormal];
    [tipBtn setTitleColor:@"#9a98c1".color forState:UIControlStateNormal];
    [tipBtn addTarget:self action:@selector(headViewClicked:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:tipBtn];
    
    UIImageView * searchImageView = [[UIImageView alloc] init];
    searchImageView.image = [UIImage imageNamed:@"search"];
    searchImageView.frame = CGRectMake(screenWidth-15-32, 11, 22, 21);
    [headView addSubview:searchImageView];
    
    UIButton * searchBtn = [[UIButton alloc] init];
    searchBtn.backgroundColor = [UIColor clearColor];
    [searchBtn setFrame:CGRectMake(screenWidth-15-33-10, 10, 43, 30)];
    [searchBtn addTarget:self action:@selector(searchBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:searchBtn];
}

//banner 上button点击效果
- (void)headViewClicked:(UIButton*)sender
{
    if (sender.tag == 2002)
    {
        announceFlag = School;
        [schoolBtn setTitleColor:@"#7974ea".color forState:UIControlStateNormal];
        [classBtn setTitleColor:@"#9a98c1".color forState:UIControlStateNormal];
        [tipBtn setTitleColor:@"#9a98c1".color forState:UIControlStateNormal];
    }
    else if (sender.tag == 2003)
    {
        announceFlag = Class;
        [schoolBtn setTitleColor:@"#9a98c1".color forState:UIControlStateNormal];
        [classBtn setTitleColor:@"#7974ea".color forState:UIControlStateNormal];
        [tipBtn setTitleColor:@"#9a98c1".color forState:UIControlStateNormal];
    }
    else if (sender.tag == 2004)
    {
        announceFlag = Tips;
        [schoolBtn setTitleColor:@"#9a98c1".color forState:UIControlStateNormal];
        [classBtn setTitleColor:@"#9a98c1".color forState:UIControlStateNormal];
        [tipBtn setTitleColor:@"#7974ea".color forState:UIControlStateNormal];
    }
    
    [infoTableView reloadData];
}

//搜索
- (void)searchBtnOnClick:(UIButton*)sender
{
    NSLog(@"搜索");
}

- (void)createTableView
{
    if (!infoTableView)
    {
        infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,64+45, screenWidth, screenHeight-64-49-45) style:UITableViewStylePlain];
    }
    infoTableView.delegate = self;
    infoTableView.dataSource = self;
    infoTableView.backgroundColor = @"#727c95".color;
    infoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:infoTableView];
}

- (void)headerBtnClicked:(id)sender
{
    UIButton * btn = (UIButton *)sender;
    
    UIImageView * bView = (UIImageView*)self.view ;
    UIImageView * indicatorLabel = (UIImageView*)[bView viewWithTag:250];
    [UIView animateWithDuration:0.05 animations:^{
        CGRect frame = indicatorLabel.frame;
        frame.origin.x =  (btn.tag-2000)*CGRectGetWidth(announceBtn.frame)+CGRectGetMinX(announceBtn.frame);
        indicatorLabel.frame=frame;
    }];
    
    if ([btn isEqual:announceBtn])
    {
        //公告栏
        statusFlag = Announce;
        
        [announceBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
        [babyShowBtn setTitleColor:@"#5450a0".color forState:UIControlStateNormal];
        
        headView.hidden = NO;
        infoTableView.frame = CGRectMake(0, 109, screenWidth, screenHeight-64-49-45);
    }
    else if([btn isEqual:babyShowBtn])
    {
        //宝宝秀
        statusFlag = BabyShow;
        
        [announceBtn setTitleColor:@"#5450a0".color forState:UIControlStateNormal];
        [babyShowBtn setTitleColor:KFontColorA forState:UIControlStateNormal];
        
        headView.hidden = YES;
        infoTableView.frame = CGRectMake(0, 64, screenWidth, screenHeight-64-49);
    }
    
    [infoTableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return infoArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString * secCell = @"secCell";
    
    SchoolCell *cell = [tableView dequeueReusableCellWithIdentifier:secCell];
    if (!cell)
    {
        cell = [[SchoolCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:secCell];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    
    cell.shareBtn.tag = indexPath.row;
    cell.lookBtn.tag = indexPath.row;
    cell.commentBtn.tag = indexPath.row;
    
    NSDictionary * dic = [infoArray objectAtIndex:indexPath.row];
    //头像
    [cell.photoImageView sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"bannerimg"]] placeholderImage:[UIImage imageNamed:@"newsImageView"]];
    //新闻图
    [[SDWebImageDownloader sharedDownloader] setValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:[dic objectForKey:@"bannerimg"]] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        //
    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        //
        cell.newsImageView.image = image;
    }];
    //新闻标题
    cell.titleLabel.text = [NXGlobalUtil checkNullData:dic key:@"title"];
    //新闻内容
    cell.contentLabel.text = [NXGlobalUtil checkNullData:dic key:@"announcement"];
    //名称
    cell.nameLabel.text = [NXGlobalUtil checkNullData:dic key:@"ospersion"];
    //时间
    cell.timeLabel.text = [NXGlobalUtil checkNullData:dic key:@"createtime"];
    //已阅读数
    cell.lookLabel.text = [NXGlobalUtil checkNullData:dic key:@"dznum"];
    //评论数
    cell.commentLabel.text = [NXGlobalUtil checkNullData:dic key:@"plnum"];
    
    
    //调整新闻内容行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:cell.contentLabel.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [cell.contentLabel.text length])];
    cell.contentLabel.attributedText = attributedString;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary * dic = [infoArray objectAtIndex:indexPath.row];

    NewsDetailViewController * NDVC = [[NewsDetailViewController alloc] init];
    NDVC.title = [NXGlobalUtil checkNullData:dic key:@"title"].length?[NXGlobalUtil checkNullData:dic key:@"title"]:@"公告详情";
    [self pushToViewController:NDVC];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 605;
}

#pragma mark SchoolCell button代理方法
//分享
- (void)shareWithIndex:(NSInteger)index
{
    NSLog(@"share===---%ld---",(long)index);
}

//总阅读量
- (void)lookWithIndex:(NSInteger)index
{
    NSLog(@"look===--%ld---",(long)index);

}

//总转发量
- (void)commentWithIndex:(NSInteger)index
{
    NSLog(@"comment===--%ld---",(long)index);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
