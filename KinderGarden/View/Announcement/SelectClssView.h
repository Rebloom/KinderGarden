//
//  SelectClssView.h
//  KinderGarden
//
//  Created by xdcy on 16/7/5.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectClassCell.h"

@protocol selectClassDelegate <NSObject>

- (void)hideClicked;
- (void)finishClick:(NSString*)title;

@end

@interface SelectClssView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    UIView * mainView;
    UIButton * hideBtn;
    UITableView * selectTableView;
    
    NSString * classTitle;//用来记录哪个班级
    NSMutableDictionary * selectDict;
    NSInteger indexNum;
}

@property (nonatomic,strong) UIView * bgView;
@property (nonatomic,strong) UIView * mainView;
@property (nonatomic,strong) UIButton * hideBtn;
@property (nonatomic,assign) BOOL isShow;
@property (nonatomic,assign) NSInteger rowNum;
@property (nonatomic,strong) NSMutableArray * classArr;
@property (nonatomic,weak)id<selectClassDelegate>delegate;

+ (SelectClssView *)defaultSelectClssView;
- (void) showView;
- (void) hideView;

- (id)initWithArray:(NSArray*)arr withDelegate:(id)_delegate;


@end
