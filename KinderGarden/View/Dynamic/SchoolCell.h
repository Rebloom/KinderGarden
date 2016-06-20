//
//  SchoolCell.h
//  KinderGarden
//
//  Created by xdcy on 16/5/20.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol dynamicDelegate<NSObject>

- (void)shareWithIndex:(NSInteger)index;
- (void)lookWithIndex:(NSInteger)index;
- (void)commentWithIndex:(NSInteger)index;

@end


#import <UIKit/UIKit.h>

@interface SchoolCell : UITableViewCell
{
    UIView * bgView;
    UIImageView * photoImageView;
    UIImageView * newsImageView;
    UIImageView * shareImageView;
    UIImageView * lookImageView;
    UIImageView * commentImageView;
    
    UILabel * nameLabel;
    UILabel * timeLabel;
    UILabel * titleLabel;
    UILabel * contentLabel;
    UILabel * lookLabel;
    UILabel * commentLabel;
    UILabel * lineLabel;
    
    UIButton * shareBtn;
    UIButton * lookBtn;
    UIButton * commentBtn;
}
@property(nonatomic,strong) UIView * bgView;
@property(nonatomic,strong) UIImageView * photoImageView;
@property(nonatomic,strong) UIImageView * newsImageView;
@property(nonatomic,strong) UIImageView * shareImageView;
@property(nonatomic,strong) UIImageView * lookImageView;
@property(nonatomic,strong) UIImageView * commentImageView;

@property(nonatomic,strong) UILabel * nameLabel;
@property(nonatomic,strong) UILabel * timeLabel;
@property(nonatomic,strong) UILabel * titleLabel;
@property(nonatomic,strong) UILabel * contentLabel;
@property(nonatomic,strong) UILabel * lookLabel;
@property(nonatomic,strong) UILabel * commentLabel;
@property(nonatomic,strong) UILabel * lineLabel;

@property(nonatomic,strong) UIButton * shareBtn;
@property(nonatomic,strong) UIButton * lookBtn;
@property(nonatomic,strong) UIButton * commentBtn;

@property(nonatomic,assign) id<dynamicDelegate>delegate;
@end
