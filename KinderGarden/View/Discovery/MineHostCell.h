//
//  MineHostCell.h
//  KinderGarden
//
//  Created by xdcy on 16/6/24.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MineHostCellDelegate <NSObject>

- (void)pinglunIndex:(NSInteger)index;
- (void)zanIndex:(NSInteger)index;

@end

@interface MineHostCell : UICollectionViewCell
{
    UIView * bgView;
    
    UIImageView * photoImageView;
    UIImageView * picImageView;
    
    UILabel * nameLabel;
    UILabel * timeLabel;
    UILabel * contentLabel;
    
    UIImageView * pinglunImageView;
    UILabel * pinglunLabel;
    UIButton * pinglunBtn;
    
    UIImageView * zanImageView;
    UILabel * zanLabel;
    UIButton * zanBtn;
}
@property(nonatomic,strong) UIView * bgView;

@property(nonatomic,strong) UIImageView * photoImageView;
@property(nonatomic,strong) UIImageView * picImageView;

@property(nonatomic,strong) UILabel * nameLabel;
@property(nonatomic,strong) UILabel * timeLabel;
@property(nonatomic,strong) UILabel * contentLabel;

@property(nonatomic,strong) UIImageView * pinglunImageView;
@property(nonatomic,strong) UILabel * pinglunLabel;
@property(nonatomic,strong) UIButton * pinglunBtn;

@property(nonatomic,strong) UIImageView * zanImageView;
@property(nonatomic,strong) UILabel * zanLabel;
@property(nonatomic,strong) UIButton * zanBtn;

@property(nonatomic,weak)id<MineHostCellDelegate>delegate;
@end
