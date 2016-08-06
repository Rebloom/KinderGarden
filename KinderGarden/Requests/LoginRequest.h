//
//  LoginRequest.h
//  KinderGarden
//
//  Created by haonanchen on 16/8/6.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "NXBaseRequest.h"

#define kTagRegisterGetCodeRequest      @"jgkj/getCode?"

@interface LoginRequest : NXBaseRequest

+ (void)getRegisterCheckCodeWithPhoneNumber:(NSString *)phone delegate:(id)_delegate;

@end
