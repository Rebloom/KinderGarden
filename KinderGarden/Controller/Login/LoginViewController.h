//
//  LoginViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

#import "LoginRequest.h"

@interface LoginViewController : BasicViewController<UITextFieldDelegate>
{
    UITextField * userNameTf;
    UITextField * pwdTf;
}
@end
