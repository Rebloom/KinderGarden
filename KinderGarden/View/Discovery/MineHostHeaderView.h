//
//  MineHostHeaderView.h
//  KinderGarden
//
//  Created by xdcy on 16/6/24.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MineHostHeaderDelegate <NSObject>
- (void)photoBtnClick;
- (void)guanzhuBtnClick;
- (void)funsBtnClick;
- (void)wodeTieziBtnClick;
- (void)ILookBtnClick;
- (void)fangkeBtnClick;
- (void)backBtnClick;
@end



@interface MineHostHeaderView : UICollectionReusableView
{
    UIImageView * bgImageView;
    UIImageView * picImageView;
    UIImageView * photoImageView;
    UIImageView * setImageView;
    UIImageView * placeImageView;
    
    UIButton * backBtn;
    UIImageView * backImageView;
    
    UILabel * nameLabel;
    UILabel * placeLabel;
    UILabel * fangkeLabel;
    
    UIImageView * lookImageView;
    UILabel * liulanLabel;
    
    UIButton * fangkeBtn;
    
    UIView * alphaView;
    
    UILabel * photoNumLabel;
    UILabel * photoLabel;
    UILabel * guanzhuNumLabel;
    UILabel * guanzhuLabel;
    UILabel * funsNumLabel;
    UILabel * funsLabel;
    
    UILabel * verOneLabel;
    UILabel * verTwoLabel;
    
    UIButton * photoBtn;
    UIButton * guanzhuBtn;
    UIButton * funsBtn;
    
    UIButton * wodeTieziBtn;
    UIButton * ILookBtn;
}
@property(nonatomic,strong) UIButton * backBtn;
@property(nonatomic,strong) UIImageView * backImageView;
@property(nonatomic,strong) UIImageView * bgImageView;
@property(nonatomic,strong) UIImageView * picImageView;
@property(nonatomic,strong) UIImageView * photoImageView;
@property(nonatomic,strong) UIImageView * setImageView;
@property(nonatomic,strong) UIImageView * placeImageView;
@property(nonatomic,strong) UILabel * nameLabel;
@property(nonatomic,strong) UILabel * placeLabel;
@property(nonatomic,strong) UILabel * fangkeLabel;
@property(nonatomic,strong) UIImageView * lookImageView;
@property(nonatomic,strong) UILabel * liulanLabel;
@property(nonatomic,strong) UIButton * fangkeBtn;
@property(nonatomic,strong) UIView * alphaView;
@property(nonatomic,strong) UILabel * photoNumLabel;
@property(nonatomic,strong) UILabel * photoLabel;
@property(nonatomic,strong) UILabel * guanzhuNumLabel;
@property(nonatomic,strong) UILabel * guanzhuLabel;
@property(nonatomic,strong) UILabel * funsNumLabel;
@property(nonatomic,strong) UILabel * funsLabel;
@property(nonatomic,strong) UILabel * verOneLabel;
@property(nonatomic,strong) UILabel * verTwoLabel;
@property(nonatomic,strong) UIButton * photoBtn;
@property(nonatomic,strong) UIButton * guanzhuBtn;
@property(nonatomic,strong) UIButton * funsBtn;
@property(nonatomic,strong) UIButton * wodeTieziBtn;
@property(nonatomic,strong) UIButton * ILookBtn;

@property(nonatomic,weak) id<MineHostHeaderDelegate>delegate;

@end
