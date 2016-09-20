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

@interface UserRequest : NXBaseRequest

+ (void)requestTeacherInfoWithDelegate:(id)_delegate;

+ (void)modifyTeacherInfoWithTeacherID:(NSString *)teacherid operateID:(NSString *)ostmpinfoid permission:(NSString *)permissions position:(NSString *)analysis delegate:(id)_delegate;

@end
