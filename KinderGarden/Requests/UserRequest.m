//
//  UserRequest.m
//  KinderGarden
//
//  Created by Rebloom on 16/8/7.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "UserRequest.h"

@implementation UserRequest

+ (void)requestTeacherInfoWithDelegate:(id)_delegate
{
    if ([GFStaticData getObjectForKey:kTagUserKeyID])
    {
        UserRequest * request = [[UserRequest alloc] init];
        request.vrCodeString = kTagRequestTeacherInfo;
        request.delegate = _delegate;
        
        [request.params setObject:[GFStaticData getObjectForKey:kTagUserKeyID] forKey:@"tmpinfoid"];
        
        [request start];
    }
    else
    {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"用户id为空"];
    }
}

+ (void)modifyTeacherInfoWithTeacherID:(NSString *)teacherid operateID:(NSString *)ostmpinfoid permission:(NSString *)permissions position:(NSString *)analysis delegate:(id)_delegate
{
    UserRequest * request = [[UserRequest alloc] init];
    request.vrCodeString = kTagModifyTeacherInfo;
    request.delegate = _delegate;
    
    [request.params setObject:teacherid forKey:@"teacherid"];
    [request.params setObject:ostmpinfoid forKey:@"ostmpinfoid"];
    [request.params setObject:permissions forKey:@"permissions"];
    [request.params setObject:analysis forKey:@"analysis"];
    
    [request start];
}


@end
