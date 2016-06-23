//
//  ParentHeaderView.h
//  KinderGarden
//
//  Created by xdcy on 16/6/23.
//  Copyright © 2016年 haonanchen. All rights reserved.
//
#import <UIKit/UIKit.h>

@protocol collectionBtnDelegate <NSObject>

- (void)newtopicOnclick;
- (void)tuijianOnclick;
- (void)quanziOnclick;

@end



@interface ParentHeaderView : UICollectionReusableView
{
    UIView * topView;
    UIImageView * lunboImageView;
    UIImageView * photoImageView;
    UILabel * nameLabel;
    UILabel * guanzhuLabel;
    UILabel * fensiLabel;
    UILabel * lineLabel;
    
    UIButton * newsBtn;
    UIButton * recommendBtn;
    UIButton * mineBtn;

}
@property(nonatomic,strong) UIView * topView;
@property(nonatomic,strong) UIImageView * lunboImageView;
@property(nonatomic,strong) UIImageView * photoImageView;
@property(nonatomic,strong) UILabel * nameLabel;
@property(nonatomic,strong) UILabel * guanzhuLabel;
@property(nonatomic,strong) UILabel * fensiLabel;
@property(nonatomic,strong) UILabel * lineLabel;
@property(nonatomic,strong) UIButton * newsBtn;
@property(nonatomic,strong) UIButton * recommendBtn;
@property(nonatomic,strong) UIButton * mineBtn;
@property(nonatomic,weak) id<collectionBtnDelegate>delegate;
@end
