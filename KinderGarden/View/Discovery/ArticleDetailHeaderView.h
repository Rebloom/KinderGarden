//
//  ArticleDetailHeaderView.h
//  KinderGarden
//
//  Created by xdcy on 16/6/27.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ArticleDetailHeaderDelegate <NSObject>
- (void)attentiontoBtnClick;
- (void)jubaoBtnClick;
- (void)backtoBtnClick;
- (void)shareBtnClick;
@end


@interface ArticleDetailHeaderView : UIView
{
    BOOL isSelect;
}
@property(nonatomic,strong) UIView * bgView;
@property(nonatomic,strong) UIImageView * topImageView;
@property(nonatomic,strong) UIButton * backBtn;
@property(nonatomic,strong) UIImageView * backImageView;
@property(nonatomic,strong) UIButton * shareBtn;
@property(nonatomic,strong) UIImageView * shareImageView;
@property(nonatomic,strong) UIImageView * lookImageView;
@property(nonatomic,strong) UILabel * lookLabel;

@property(nonatomic,strong) UIView * firstView;
@property(nonatomic,strong) UIImageView * photoImageView;
@property(nonatomic,strong) UILabel * nameLabel;
@property(nonatomic,strong) UILabel * timeLabel;
@property(nonatomic,strong) UIButton * attentionBtn;

@property(nonatomic,strong) UIView * secondView;
@property(nonatomic,strong) UILabel * contentsLabel;
@property(nonatomic,strong) UILabel * lineLabel;
@property(nonatomic,strong) UIButton * jubaoBtn;

@property(nonatomic,strong) UILabel * pinglunLabel;
@property(nonatomic,assign) id<ArticleDetailHeaderDelegate>delegate;
@end
