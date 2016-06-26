//
//  MineHostViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/6/24.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"
#import "MineHostCell.h"
#import "MineHostHeaderView.h"

@interface MineHostViewController : BasicViewController<UICollectionViewDataSource,UICollectionViewDelegate,MineHostCellDelegate,MineHostHeaderDelegate>
{
    NSArray *titlearray;
    UICollectionViewFlowLayout *flowLayout;
    UICollectionView * myCollectionV;
    NSString * bannerFlag;
}
@property(nonatomic,strong) NSMutableArray * imageArr;
@property(nonatomic,strong) NSMutableArray * heightArr;


@end
