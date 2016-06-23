//
//  LookCell.h
//  KinderGarden
//
//  Created by xdcy on 16/6/23.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LookCellDelegate <NSObject>

- (void)lookIndex:(NSInteger)index;

@end

@interface LookCell : UITableViewCell
{
    UIImageView * photoImageView;
    UIImageView * moreImageView;
    UILabel * nameLabel;
    UILabel * timeLabel;
    UILabel * lineLabel;
    UIButton * moreBtn;
}

@property(nonatomic,strong) UIImageView * photoImageView;
@property(nonatomic,strong) UIImageView * moreImageView;
@property(nonatomic,strong) UILabel * nameLabel;
@property(nonatomic,strong) UILabel * timeLabel;
@property(nonatomic,strong) UIButton * moreBtn;
@property(nonatomic,strong) UILabel * lineLabel;
@property(nonatomic,weak) id<LookCellDelegate>delegate;
@end
