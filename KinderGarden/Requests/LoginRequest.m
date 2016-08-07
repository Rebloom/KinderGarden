//
//  LoginRequest.m
//  KinderGarden
//
//  Created by haonanchen on 16/8/6.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest

+ (void)getRegisterCheckCodeWithPhoneNumber:(NSString *)phone delegate:(id)_delegate
{
    LoginRequest * request = [[LoginRequest alloc] init];
    request.vrCodeString = kTagRegisterGetCodeRequest;
    request.delegate = _delegate;
    [request.params setObject:phone forKey:@"phone"];
    
    [request start];
}

+ (void)registerWithUserName:(NSString *)phone password:(NSString *)password code:(NSString *)code delegate:(id)_delegate
{
    LoginRequest * request = [[LoginRequest alloc] init];
    request.vrCodeString = kTagRegisterRequest;
    request.delegate = _delegate;
    
    [request.params setObject:phone forKey:@"phone"];
    [request.params setObject:password forKey:@"passwd"];
    [request.params setObject:code forKey:@"code"];
    [request.params setObject:code forKey:@"phoneCode"];
    
    [request start];
}

+ (void)loginWithUserName:(NSString *)phone password:(NSString *)password delegate:(id)_delegate
{
    LoginRequest * request = [[LoginRequest alloc] init];
    request.vrCodeString = kTagLoginRequest;
    request.delegate = _delegate;
    
    [request.params setObject:phone forKey:@"phone"];
    [request.params setObject:password forKey:@"passwd"];
    
    [request start];
}

+ (void)resetPasswordWithPhone:(NSString *)phone checkCode:(NSString *)code delegate:(id)_delegate
{
    LoginRequest * request = [[LoginRequest alloc] init];
    request.vrCodeString = kTagResetPasswordCheckCode;
    request.delegate = _delegate;
    
    [request.params setObject:phone forKey:@"phone"];
    [request.params setObject:code forKey:@"phoneCode"];
    
    [request start];
}

+ (void)resetPasswordWithPhone:(NSString *)phone password:(NSString *)password delegate:(id)_delegate
{
    LoginRequest * request = [[LoginRequest alloc] init];
    request.vrCodeString = kTagResetPasswordRequest;
    request.delegate = _delegate;
    
    [request.params setObject:phone forKey:@"phone"];
    [request.params setObject:password forKey:@"passwd"];
    
    [request start];
}


@end
