//
//  FifthCell.h
//  KinderGarden
//
//  Created by 孤星之殇 on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FifthCell : UITableViewCell
{
    UILabel * nameLabel;
    UILabel * rightLabel;
    UIImageView * rightImageView;
}

@property(nonatomic,strong) UILabel * nameLabel;
@property(nonatomic,strong) UILabel * rightLabel;
@property(nonatomic,strong) UIImageView * rightImageView;

@end
