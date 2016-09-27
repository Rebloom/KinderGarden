//
//  UserRequest.h
//  KinderGarden
//
//  Created by Rebloom on 16/8/7.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "NXBaseRequest.h"

#import "GFStaticData.h"

#import "TKAlertCenter.h"

// 请求教师详情
#define kTagRequestTeacherInfo              @"teacherinfo/getTeacherinfo?"
// 修改教师权限
#define kTagModifyTeacherInfo               @"schoolTeacher/schoolTeacherUpdate?"
// 更新教师信息
#define kTagUpdateTeacherInfo               @"jgkj/teacherinfoSave?"

@interface UserRequest : NXBaseRequest

+ (void)requestTeacherInfoWithDelegate:(id)_delegate;

+ (void)modifyTeacherInfoWithTeacherID:(NSString *)teacherid operateID:(NSString *)ostmpinfoid permission:(NSString *)permissions position:(NSString *)analysis delegate:(id)_delegate;

+ (void)updateTeacherInfoWithSchoolID:(NSString *)schoolID headerImage:(NSString *)headerImageUrl nickName:(NSString *)nickName teacherName:(NSString *)teacherName sex:(NSString *)sex nationality:(NSString *)nationality birthday:(NSString *)birthdate phone:(NSString *)phone kbwx:(NSString *)kbwx kbqq:(NSString *)kbqq classid:(NSString *)classid onthejob:(NSString *)onthejob permissions:(NSString *)permissions analysis:(NSString *)analysis schoolname:(NSString *)schoolname delegate:(id)_delegate;

@end
