//
//  ClassRequest.m
//  KinderGarden
//
//  Created by Rebloom on 16/8/7.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "ClassRequest.h"

@implementation ClassRequest

+ (void)addOneClassWithSchoolID:(NSString *)schoolID className:(NSString *)className chiefTeacherID:(NSString *)chiefTeacher teacherIDs:(NSString *)teacherIDs delegate:(id)_delegate
{
    ClassRequest * request = [[ClassRequest alloc] init];
    request.vrCodeString = kTagAddOneClassRequest;
    request.delegate = _delegate;
    
    [request.params setObject:schoolID forKey:@"schoolid"];
    [request.params setObject:className forKey:@"classname"];
    [request.params setObject:chiefTeacher forKey:@"classadviser"];
    [request.params setObject:teacherIDs forKey:@"teacherid"];
    
    [request start];
}

+ (void)modifyClassInfoWithSchoolID:(NSString *)schoolID classID:(NSString *)classID teacherIDs:(NSString *)teacherIDs delegate:(id)_delegate
{
    ClassRequest * request = [[ClassRequest alloc] init];
    request.vrCodeString = kTagModifyClassInfoRequest;
    request.delegate = _delegate;
    
    [request.params setObject:schoolID forKey:@"schoolid"];
    [request.params setObject:classID forKey:@"classid"];
    [request.params setObject:teacherIDs forKey:@"teacherids"];
    
    [request start];
}

+ (void)getClassListWithSchoolID:(NSString *)schoolID chiefTeacher:(NSString *)teacher delegate:(id)_delegate
{
    ClassRequest * request = [[ClassRequest alloc] init];
    request.vrCodeString = kTagSearchClassListRequest;
    request.delegate = _delegate;
    
    [request.params setObject:schoolID forKey:@"schoolid"];
    [request.params setObject:teacher forKey:@"classadviser"];
    
    [request start];
}

@end
