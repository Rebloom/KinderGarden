//
//  CourseRequest.h
//  KinderGarden
//
//  Created by Rebloom on 16/8/7.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "NXBaseRequest.h"

// 添加一门课程
#define kTagAddOneCourseRequest                 @"coursetime/save?"

// 获取课程列表
#define kRequestTagGetCourseList                @"coursetime/coursetimeList?"

@interface CourseRequest : NXBaseRequest

+ (void)addOneCourseWithWeekNumber:(NSString *)weekNumber courseTime:(NSString *)time course:(NSString *)course classIDs:(NSMutableArray *)classes operateID:(NSString *)personID delegate:(id)_delegate;

+ (void)requestCourseListWithRows:(NSInteger)rows page:(NSInteger)page weeknum:(NSString *)weeknum festivals:(NSString *)festivals course:(NSString *)course clssids:(NSString *)clssids delegate:(id)_delegate;

@end
