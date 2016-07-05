//
//  CoursesCell.h
//  KinderGarden
//
//  Created by 孤星之殇 on 16/7/3.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CourcesDelegate <NSObject>

- (void)deleteWithIndex:(UIButton*)sender WithSection:(NSInteger)section;
- (void)addClassWithIndex:(NSInteger)index;
- (void)editClassWithIndex:(UIButton*)sender WithSection:(NSInteger)section ;
@end

@interface CoursesCell : UITableViewCell
{
    UILabel * numLabel;
    UILabel * classNameLabel;
    UIImageView * deleteImageView;
    UIButton * deleteBtn;
    UIButton * addClassBtn;
    UIButton * editClassBtn;
}

@property(nonatomic,strong) UILabel * numLabel;
@property(nonatomic,strong) UILabel * classNameLabel;
@property(nonatomic,strong) UIButton * deleteBtn;
@property(nonatomic,strong) UIImageView * deleteImageView;
@property(nonatomic,strong) UIButton * addClassBtn;
@property(nonatomic,strong) UIButton * editClassBtn;
@property(nonatomic,assign) id<CourcesDelegate>delegate;
@property(nonatomic)NSInteger section;

@end
