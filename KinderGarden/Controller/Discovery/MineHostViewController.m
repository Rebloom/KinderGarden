//
//  MineHostViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/6/24.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "MineHostViewController.h"
#import "AttentionAndFunsViewController.h"
#import "LookViewController.h"
#import "ArticleDetailViewController.h"

#define MyCard    @"MyCard"
#define HaveSeen     @"HaveSeen"

@interface MineHostViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@end

//设置标识
static NSString * collectionIndentify = @"collectionIndentify";
static NSString * headerIndentify = @"MineHostHeaderView";

@implementation MineHostViewController
@synthesize imageArr;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [headerView loadComponentsWithTitle:@"个人主页" withTitleColor:KBlackColor];
    [headerView setStatusBarColor:KFontColorA];
    [headerView backButton];
    
    bannerFlag = MyCard;
    
    [self addTheCollectionView];
    
}

//创建视图
-(void)addTheCollectionView
{
    flowLayout = [self setUICollectionViewFlowLayout:flowLayout
                                               Width:0
                                                High:0
                                         minHspacing:0.f
                                         minVspacing:10.f
                                            UiedgeUp:0.f
                                          Uiedgeleft:10.f
                                        Uiedgebottom:0.f
                                         Uiedgeright:0.f
                                         Scdirection:YES];
    flowLayout.headerReferenceSize = CGSizeMake(screenWidth, 400);
    
    //创建一个UICollectionView
    myCollectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) collectionViewLayout:flowLayout];
    //设置代理为当前控制器
    myCollectionV.delegate = self;
    myCollectionV.dataSource = self;
    myCollectionV.backgroundColor = kBackgroundColor;
    
    [myCollectionV registerClass:[MineHostCell class] forCellWithReuseIdentifier:collectionIndentify];
    [myCollectionV registerClass:[MineHostHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIndentify];
    
    [self.view addSubview:myCollectionV];
}

#pragma mark set UICollectionViewFlowLayout
-(UICollectionViewFlowLayout *)setUICollectionViewFlowLayout:(UICollectionViewFlowLayout *)flow
                                                       Width:(float) width
                                                        High:(float) high
                                                 minHspacing:(float) minhs
                                                 minVspacing:(float) minvs
                                                    UiedgeUp:(float) up
                                                  Uiedgeleft:(float) left
                                                Uiedgebottom:(float)bottom
                                                 Uiedgeright:(float)right
                                                 Scdirection:(BOOL) direction
{
    flow = [UICollectionViewFlowLayout new];
    //格子的大小 (长，高)
    flow.itemSize = CGSizeMake(width, high);
    //横向最小距离
    flow.minimumInteritemSpacing = minhs;
    //代表的是纵向的空间间隔
    flow.minimumLineSpacing=minvs;
    //设置，上／左／下／右 边距 空间间隔数是多少
    flow.sectionInset = UIEdgeInsetsMake(up, left, bottom, right);
    
    //确定是水平滚动，还是垂直滚动
    if (direction)
    {
        [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    }
    else
    {
        [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    }
    return flow;
}


#pragma mark --UICollectionView dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake((self.view.bounds.size.width-10)/2, 290);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MineHostCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:collectionIndentify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.delegate = self;
    
    cell.pinglunBtn.tag = indexPath.row;
    cell.zanBtn.tag = indexPath.row;
    
    if ([bannerFlag isEqualToString:MyCard])
    {
        cell.picImageView.image = [UIImage imageNamed:@"beauty5.jpg"];
        cell.photoImageView.image = [UIImage imageNamed:@"beauty5.jpg"];
        cell.nameLabel.text = @"孤星";
        cell.timeLabel.text = @"12个小时前";
        cell.contentLabel.text = @"今天夜里到明天白天，大部分天气多云转晴，有小到中雨，局部地区会有泥石流。请做好安全防范措施";
        cell.pinglunLabel.text = @"236";
        cell.zanLabel.text = @"1033";
    }
    else if ([bannerFlag isEqualToString:HaveSeen])
    {
        cell.picImageView.image = [UIImage imageNamed:@"beauty3.jpg"];
        cell.photoImageView.image = [UIImage imageNamed:@"beauty3.jpg"];
        cell.nameLabel.text = @"落叶";
        cell.timeLabel.text = @"1天前";
        cell.contentLabel.text = @"脱欧公投解读:英国为什么要跟欧盟闹分手?";
        cell.pinglunLabel.text = @"236";
        cell.zanLabel.text = @"1033";
    }
    
    return cell;
}

- (void)pinglunIndex:(NSInteger)index
{
    NSLog(@"评论了第%ld条",(long)index);
}

- (void)zanIndex:(NSInteger)index
{
    NSLog(@"第%ld条被赞了",(long)index);
}

//设置头尾部内容
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        MineHostHeaderView *headerV = (MineHostHeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIndentify forIndexPath:indexPath];
        headerV.delegate = self;
        reusableView = headerV;
    }
    if (kind == UICollectionElementKindSectionFooter){
        reusableView = nil;
    }
    return reusableView;
}

//返回
- (void)backBtnClick
{
    [self back];
}

//我的帖子
- (void)wodeTieziBtnClick
{
    bannerFlag = MyCard;
    
    [myCollectionV reloadData];
}

//我看过谁
- (void)ILookBtnClick
{
    bannerFlag = HaveSeen;
    
    [myCollectionV reloadData];
}

//访客
- (void)fangkeBtnClick
{
    LookViewController * LVC = [[LookViewController alloc] init];
    [self pushToViewController:LVC];
}

//照片
- (void)photoBtnClick
{

}

//关注
- (void)guanzhuBtnClick
{
    AttentionAndFunsViewController * AAFVC = [[AttentionAndFunsViewController alloc] init];
    AAFVC.pushFlag = 0;
    [self pushToViewController:AAFVC];
}

//粉丝
-(void)funsBtnClick
{
    AttentionAndFunsViewController * AAFVC = [[AttentionAndFunsViewController alloc] init];
    AAFVC.pushFlag = 1;
    [self pushToViewController:AAFVC];
}

//点击单元格
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([bannerFlag isEqualToString:MyCard])
    {
        
    }
    else if ([bannerFlag isEqualToString:HaveSeen])
    {
        
    }

    ArticleDetailViewController * ADVC = [[ArticleDetailViewController alloc] init];
    [self pushToViewController:ADVC];
    
    NSLog(@"indexPath.section==%ld,indexPath.row==%ld",(long)indexPath.section,(long)indexPath.row);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 10, 5, 0);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if ([scrollView isEqual:myCollectionV])
    {
        if (scrollView.contentOffset.y < 30)
        {
            headerView.alpha = 0;
            [self.view bringSubviewToFront:myCollectionV];
            
        }
        else if (scrollView.contentOffset.y > 150)
        {
            headerView.alpha = 1;
            [self.view bringSubviewToFront:headerView];
            [self.view sendSubviewToBack:myCollectionV];
        }
        else
        {
            headerView.alpha = (scrollView.contentOffset.y/120);
            [self.view sendSubviewToBack:myCollectionV];
        }
    }
}
@end