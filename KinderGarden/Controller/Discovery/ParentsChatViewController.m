//
//  ParentsChatViewController.m
//  KinderGarden
//
//  Created by xdcy on 16/6/22.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "ParentsChatViewController.h"
#define NewTopic    @"newtopic"
#define Remmand     @"remmand"
#define Mine        @"Mine"

@interface ParentsChatViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@end

//设置标识
static NSString * collectionIndentify = @"collectionIndentify";
static NSString * headerIndentify = @"ParentHeaderView";

@implementation ParentsChatViewController
@synthesize imageArr;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [headerView loadComponentsWithTitle:@"父母圈" withTitleColor:KBlackColor];
    [headerView setStatusBarColor:KFontColorA];
    [headerView backButton];
    
    bannerFlag = NewTopic;
    
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
    flowLayout.headerReferenceSize = CGSizeMake(screenWidth, 450);
    
    //创建一个UICollectionView
    myCollectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) collectionViewLayout:flowLayout];
    //设置代理为当前控制器
    myCollectionV.delegate = self;
    myCollectionV.dataSource = self;
    myCollectionV.backgroundColor =[UIColor lightGrayColor];
    
    [myCollectionV registerClass:[ParentCell class] forCellWithReuseIdentifier:collectionIndentify];
    [myCollectionV registerClass:[ParentHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIndentify];

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
    ParentCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:collectionIndentify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.delegate = self;
    
    cell.pinglunBtn.tag = indexPath.row;
    cell.zanBtn.tag = indexPath.row;

    if ([bannerFlag isEqualToString:NewTopic])
    {
        cell.picImageView.image = [UIImage imageNamed:@"beauty5.jpg"];
        cell.photoImageView.image = [UIImage imageNamed:@"beauty5.jpg"];
        cell.nameLabel.text = @"孤星";
        cell.timeLabel.text = @"12个小时前";
        cell.contentLabel.text = @"今天夜里到明天白天，大部分天气多云转晴，有小到中雨，局部地区会有泥石流。请做好安全防范措施";
        cell.pinglunLabel.text = @"236";
        cell.zanLabel.text = @"1033";
    }
    else if ([bannerFlag isEqualToString:Remmand])
    {
        cell.picImageView.image = [UIImage imageNamed:@"beauty3.jpg"];
        cell.photoImageView.image = [UIImage imageNamed:@"beauty3.jpg"];
        cell.nameLabel.text = @"落叶";
        cell.timeLabel.text = @"1天前";
        cell.contentLabel.text = @"脱欧公投解读:英国为什么要跟欧盟闹分手?";
        cell.pinglunLabel.text = @"236";
        cell.zanLabel.text = @"1033";
    }
    else if ([bannerFlag isEqualToString:Mine])
    {
        cell.picImageView.image = [UIImage imageNamed:@"beauty0.jpg"];
        cell.photoImageView.image = [UIImage imageNamed:@"beauty0.jpg"];
        cell.nameLabel.text = @"Hades";
        cell.timeLabel.text = @"12天前";
        cell.contentLabel.text = @"这也是为什么英国加入了欧盟,却一直保留英镑而未加入欧元区的根本原因之一。 如今,德法要通过让英国承担更大责任的方式,一步步地收缩英国的权力,最终...";
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
        ParentHeaderView *headerV = (ParentHeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIndentify forIndexPath:indexPath];
        headerV.delegate = self;
        reusableView = headerV;
    }
    if (kind == UICollectionElementKindSectionFooter){
        reusableView = nil;
    }
    return reusableView;
}

- (void)newtopicOnclick
{
    NSLog(@"最新话题");
    bannerFlag = NewTopic;
    
    [myCollectionV reloadData];
}

- (void)tuijianOnclick
{
    NSLog(@"推荐达人");
    bannerFlag = Remmand;

    [myCollectionV reloadData];
}

- (void)quanziOnclick
{
    NSLog(@"我的圈子");
    bannerFlag = Mine;

    [myCollectionV reloadData];
}

//点击单元格
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([bannerFlag isEqualToString:NewTopic])
    {
        
    }
    else if ([bannerFlag isEqualToString:Remmand])
    {
    
    }
    else if ([bannerFlag isEqualToString:Mine])
    {
    
    }
    NSLog(@"indexPath.section==%ld,indexPath.row==%ld",(long)indexPath.section,(long)indexPath.row);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
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