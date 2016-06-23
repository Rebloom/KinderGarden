//
//  AttentionAndFunsCell.h
//  KinderGarden
//
//  Created by xdcy on 16/6/23.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AttentionAndFunsDelegate <NSObject>

- (void)attentionIndex:(NSInteger)index;

@end

@interface AttentionAndFunsCell : UITableViewCell
{
    UIImageView * photoImageView;
    UILabel * nameLabel;
    UILabel * timeLabel;
    UILabel * lineLabel;
    UIButton * attentionBtn;
    BOOL isSelect;
}

@property(nonatomic,strong) UIImageView * photoImageView;
@property(nonatomic,strong) UILabel * nameLabel;
@property(nonatomic,strong) UILabel * timeLabel;
@property(nonatomic,strong) UIButton * attentionBtn;
@property(nonatomic,strong) UILabel * lineLabel;
@property(nonatomic,weak) id<AttentionAndFunsDelegate>delegate;
@end
