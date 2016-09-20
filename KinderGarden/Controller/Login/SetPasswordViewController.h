//
//  SetPasswordViewController.h
//  KinderGarden
//
//  Created by 孤星之殇 on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

@interface SetPasswordViewController : BasicViewController<UITextFieldDelegate>
{
    UITextField * pwdTf;
    UITextField * confirmTf;
}

@property (nonatomic, copy) NSString * passPhone;

@end
