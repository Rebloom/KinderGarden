//
//  ThirdPartRequest.m
//  KinderGarden
//
//  Created by haonanchen on 16/10/10.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "ThirdPartRequest.h"

@implementation ThirdPartRequest

+ (void)requestYingShiAccessTokenWithDelegate:(id)_delegate
{
    ThirdPartRequest * request = [[ThirdPartRequest alloc] init];
    request.requestMainUrl = @"https://open.ys7.com/api/lapp/token/get?";
    request.delegate = _delegate;
    
    [request.params setObject:YSAppKey forKey:@"appKey"];
    [request.params setObject:YSAppSecret forKey:@"appSecret"];
    
    [request startThird];
}

- (NXRequestMethod)requestMethod {
    return NXRequestMethodPost;
}

@end
