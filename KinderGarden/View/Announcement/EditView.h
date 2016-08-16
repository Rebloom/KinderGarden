//
//  EditView.h
//  KinderGarden
//
//  Created by xdcy on 16/8/15.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol editViewDelegate <NSObject>

- (void)hideBtnClicked;

- (void)sureClick:(NSString*)title;

@end

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
@property (nonatomic,weak)id<editViewDelegate>delegate;

+ (EditView *)defaultEditView;

- (void) showView;//显示弹窗

- (void) hideView;//隐藏弹窗

- (void) setTitleStr:(NSString*)title;//传文案到输入框
@end
