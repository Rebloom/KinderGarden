//
//  EditView.h
//  KinderGarden
//
//  Created by xdcy on 16/8/15.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditView : UIView<UITextFieldDelegate>
{
    UIView * mainView;
    UIButton * hideBtn;
    UIView * editView;
    UITextField * editTF;
    UILabel * lineTwoLabel;
    UIButton *sureBtn;
}


@property (nonatomic,strong) UIView * mainView;
@property (nonatomic,strong) UIButton * hideBtn;
@property (nonatomic,assign) BOOL isShow;

+ (EditView *)defaultEditView;
- (void) showView;
- (void) hideView;

@end
