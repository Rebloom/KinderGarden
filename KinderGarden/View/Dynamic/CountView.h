//
//  CountView.h
//  KinderGarden
//
//  Created by 孤星之殇 on 16/6/2.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol cardFounctionDelegate <NSObject>

//道具包代理方法 --- 使用卡片
- (void)cardToUse:(NSInteger)index;

@end

@interface CountView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    UIView * mainView;
    UITableView * infoTableView;
    UIButton * topBtn;
    NSString * tableFlag;
}

@property (nonatomic,weak)id<cardFounctionDelegate>delegate;
@property (nonatomic,strong)UIView * mainView;
@property (nonatomic,strong)UITableView * infoTableView;
@property (nonatomic,strong)UIButton * topBtn;
@property (nonatomic,assign) BOOL isShow;

+ (CountView *)defaultShareView;
- (void) showView;
- (void) hideView;

- (id)initViewWithType:(NSString *)type;


@end
