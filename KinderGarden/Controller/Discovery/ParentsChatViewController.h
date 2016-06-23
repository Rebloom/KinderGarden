//
//  ParentsChatViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/6/22.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"
#import "ParentCell.h"
#import "ParentHeaderView.h"

@interface ParentsChatViewController : BasicViewController<UICollectionViewDataSource,UICollectionViewDelegate,collectionBtnDelegate,parentCellDelegate>
{
    NSArray *titlearray;
    UICollectionViewFlowLayout *flowLayout;
    UICollectionView * myCollectionV;
    NSString * bannerFlag; 
}
@property(nonatomic,strong) NSMutableArray * imageArr;
@property(nonatomic,strong) NSMutableArray * heightArr;
//@property(strong ,nonatomic) UICollectionView * myCollectionV;



@end
