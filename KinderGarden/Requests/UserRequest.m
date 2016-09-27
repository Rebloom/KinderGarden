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

+ (void)updateTeacherInfoWithSchoolID:(NSString *)schoolID headerImage:(NSString *)headerImageUrl nickName:(NSString *)nickName teacherName:(NSString *)teacherName sex:(NSString *)sex nationality:(NSString *)nationality birthday:(NSString *)birthdate phone:(NSString *)phone kbwx:(NSString *)kbwx kbqq:(NSString *)kbqq classid:(NSString *)classid onthejob:(NSString *)onthejob permissions:(NSString *)permissions analysis:(NSString *)analysis schoolname:(NSString *)schoolname delegate:(id)_delegate
{
    UserRequest * request = [[UserRequest alloc] init];
    request.vrCodeString = kTagUpdateTeacherInfo;
    request.delegate = _delegate;
    
    [request.params setObject:schoolID forKey:@"schoolid"];
    [request.params setObject:headerImageUrl forKey:@"headportrait"];
    [request.params setObject:nickName forKey:@"nickname"];
    [request.params setObject:teacherName forKey:@"teachername"];
    [request.params setObject:sex forKey:@"teachersex"];
    [request.params setObject:nationality forKey:@"nationality"];
    [request.params setObject:birthdate forKey:@"birthdate"];
    [request.params setObject:phone forKey:@"phone"];
    [request.params setObject:kbwx forKey:@"kbwx"];
    [request.params setObject:kbqq forKey:@"kbqq"];
    [request.params setObject:classid forKey:@"classid"];
    [request.params setObject:onthejob forKey:@"onthejob"];
    [request.params setObject:permissions forKey:@"permissions"];
    [request.params setObject:analysis forKey:@"analysis"];
    [request.params setObject:schoolname forKey:@"schoolname"];
    
    [request.params setObject:[GFStaticData getObjectForKey:kTagUserKeyID] forKey:@"tmpinfoid"];
    
    [request start];
}


@end
