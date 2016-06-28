//
//  ArticleDetailCell.h
//  KinderGarden
//
//  Created by xdcy on 16/6/27.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleDetailCell : UITableViewCell
{
    UIImageView * photoImageView;
    UILabel * nameLabel;
    UILabel * timeLabel;
    
    UILabel * contentLabel;
    
    UILabel * lineLabel;
    UIImageView * zanImageView;
    UIButton * zanBtn;
}

@property(nonatomic,strong) UIImageView * photoImageView;
@property(nonatomic,strong) UILabel * nameLabel;
@property(nonatomic,strong) UILabel * timeLabel;
@property(nonatomic,strong) UILabel * contentLabel;
@property(nonatomic,strong) UILabel * lineLabel;
@property(nonatomic,strong) UIImageView * zanImageView;
@property(nonatomic,strong) UIButton * zanBtn;
@end
