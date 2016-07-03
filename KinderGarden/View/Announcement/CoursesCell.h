//
//  CoursesCell.h
//  KinderGarden
//
//  Created by 孤星之殇 on 16/7/3.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CourcesDelegate <NSObject>

- (void)deleteWithIndex:(NSInteger)index;
- (void)addClassWithIndex:(NSInteger)index;

@end

@interface CoursesCell : UITableViewCell
{
    UILabel * numLabel;
    UILabel * classNameLabel;
    
    UIButton * deleteBtn;
    
    UIButton * addClassBtn;
}

@property(nonatomic,strong) UILabel * numLabel;
@property(nonatomic,strong) UILabel * classNameLabel;
@property(nonatomic,strong) UIButton * deleteBtn;
@property(nonatomic,strong) UIButton * addClassBtn;
@property(nonatomic,assign) id<CourcesDelegate>delegate;

@end
