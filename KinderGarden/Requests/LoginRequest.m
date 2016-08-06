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

@end
