//
//  CourseRequest.h
//  KinderGarden
//
//  Created by Rebloom on 16/8/7.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "NXBaseRequest.h"

// 添加一门课程
#define kTagAddOneCourseRequest                 @"/coursetime/save?"

// 

@interface CourseRequest : NXBaseRequest

+ (void)addOneCourseWithWeekNumber:(NSString *)weekNumber courseTime:(NSString *)time course:(NSString *)course classIDs:(NSMutableArray *)classes operateID:(NSString *)personID delegate:(id)_delegate;

@end
