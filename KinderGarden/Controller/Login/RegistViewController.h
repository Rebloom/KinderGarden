//
//  RegistViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

@interface RegistViewController : BasicViewController<UITextFieldDelegate>
{
    UITextField * userNameTf;
    UITextField * pwdTf;
    UITextField * codeTf;
    
    UIButton * getCodeBtn;
    NSTimer * checkTimer;
    NSInteger time;
    NSDate * date;
}

@end
