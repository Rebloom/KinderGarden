//
//  EditDataCell.h
//  KinderGarden
//
//  Created by xdcy on 16/6/24.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditDataCell : UITableViewCell<UITextFieldDelegate>
{
    UILabel * nameLabel;
    UILabel * rightLabel;
    UILabel * lineLabel;
    UIImageView * rightImageView;
    UITextField * rightTextField;
}

@property(nonatomic,strong) UILabel * nameLabel;
@property(nonatomic,strong) UILabel * rightLabel;
@property(nonatomic,strong) UILabel * lineLabel;
@property(nonatomic,strong) UIImageView * rightImageView;
@property(nonatomic,strong) UITextField * rightTextField;

@end
