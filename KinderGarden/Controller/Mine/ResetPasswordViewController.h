//
//  ResetPasswordViewController.h
//  KinderGarden
//
//  Created by xdcy on 16/5/18.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BasicViewController.h"

@interface ResetPasswordViewController : BasicViewController<UITextFieldDelegate>
{
    UITextField * oldTf;
    UITextField * newTf;
    UITextField * confirmTf;
}

@end
