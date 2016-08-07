//
//  ClassRequest.h
//  KinderGarden
//
//  Created by Rebloom on 16/8/7.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "NXBaseRequest.h"

// 添加一个班级
#define kTagAddOneClassRequest              @"/classinfo/save?"

// 修改班级信息
#define kTagModifyClassInfoRequest          @"/classTeacher/updateClassinfoList?"

// 查询班级信息
#define kTagSearchClassListRequest          @"/classinfo/getClassList?"


@interface ClassRequest : NXBaseRequest

+ (void)addOneClassWithSchoolID:(NSString *)schoolID className:(NSString *)className chiefTeacherID:(NSString *)chiefTeacher teacherIDs:(NSString *)teacherIDs delegate:(id)_delegate;

+ (void)modifyClassInfoWithSchoolID:(NSString *)schoolID classID:(NSString *)classID teacherIDs:(NSString *)teacherIDs delegate:(id)_delegate;

+ (void)getClassListWithSchoolID:(NSString *)schoolID chiefTeacher:(NSString *)teacher delegate:(id)_delegate;

@end
