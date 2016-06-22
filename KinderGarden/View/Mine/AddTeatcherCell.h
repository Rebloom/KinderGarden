//
//  AddTeatcherCell.h
//  KinderGarden
//
//  Created by xdcy on 16/6/12.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTeatcherCell : UITableViewCell
{
    UIImageView * photoImageView;
    UILabel * nameLabel;
    UIImageView * selectImageView;
}
@property (nonatomic,strong) UIImageView * photoImageView;
@property (nonatomic,strong) UILabel * nameLabel;
@property (nonatomic,strong) UIImageView * selectImageView;

@end
