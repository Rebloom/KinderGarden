//
//  FindPasswordViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

@interface FindPasswordViewController : BasicViewController<UITextFieldDelegate>
{
    UITextField * userNameTf;
    UITextField * codeTf;
    
    UIButton * getCodeBtn;
    NSTimer * checkTimer;
    NSInteger time;
    NSDate * date;
}

@property(nonatomic,assign) NSInteger flag;
@end
