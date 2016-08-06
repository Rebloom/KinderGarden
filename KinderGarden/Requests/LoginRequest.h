//
//  LoginRequest.h
//  KinderGarden
//
//  Created by haonanchen on 16/8/6.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "NXBaseRequest.h"

#define kTagRegisterGetCodeRequest      @"jgkj/getCode?"
#define kTagRegisterRequest             @"jgkj/regtuser?"
#define kTagLoginRequest                @"jgkj/loginUser?"

@interface LoginRequest : NXBaseRequest

+ (void)getRegisterCheckCodeWithPhoneNumber:(NSString *)phone delegate:(id)_delegate;

+ (void)registerWithUserName:(NSString *)phone password:(NSString *)password code:(NSString *)code delegate:(id)_delegate;

+ (void)loginWithUserName:(NSString *)phone password:(NSString *)password delegate:(id)_delegate;

@end
