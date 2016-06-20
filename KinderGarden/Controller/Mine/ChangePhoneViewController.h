//
//  ChangePhoneViewController.h
//  KinderGarden
//
//  Created by 孤星之殇 on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

@interface ChangePhoneViewController : BasicViewController<UITextFieldDelegate>
{
    UITextField * phoneTF;
    UITextField * codeTF;

    UIButton * getCodeBtn;
    NSTimer * checkTimer;
    NSInteger time;
    NSDate * date;
}

@end
