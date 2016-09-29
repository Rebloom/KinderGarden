//
//  CourseRequest.m
//  KinderGarden
//
//  Created by Rebloom on 16/8/7.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "CourseRequest.h"

@implementation CourseRequest

+ (void)addOneCourseWithWeekNumber:(NSString *)weekNumber courseTime:(NSString *)time course:(NSString *)course classIDs:(NSMutableArray *)classes operateID:(NSString *)personID delegate:(id)_delegate
{
    CourseRequest * request = [[CourseRequest alloc] init];
    request.vrCodeString = kTagAddOneCourseRequest;
    request.delegate = _delegate;
    
    [request.params setObject:weekNumber forKey:@"weeknum"];
    [request.params setObject:time forKey:@"festivals"];
    [request.params setObject:course forKey:@"course"];
    
    NSString * classesString = @"";
    for (NSString * str in classes)
    {
        classesString = [classesString stringByAppendingString:[NSString stringWithFormat:@"%@,",str]];
    }
    classesString = [classesString substringToIndex:classesString.length-1];
    [request.params setObject:classesString forKey:@"clssids"];
    [request.params setObject:personID forKey:@"osperion"];
    
    [request start];
}

+ (void)requestCourseListWithRows:(NSInteger)rows page:(NSInteger)page weeknum:(NSString *)weeknum festivals:(NSString *)festivals course:(NSString *)course clssids:(NSString *)clssids delegate:(id)_delegate
{
    CourseRequest * request = [[CourseRequest alloc] init];
    request.vrCodeString = kRequestTagGetCourseList;
    request.delegate = _delegate;
    
    [request.params setObject:[NSString stringWithFormat:@"%@",@(rows)] forKey:@"rows"];
    [request.params setObject:[NSString stringWithFormat:@"%@",@(page)] forKey:@"page"];
    if (weeknum.length)
    {
        [request.params setObject:weeknum forKey:@"weeknum"];
    }
    if (festivals.length)
    {
        [request.params setObject:festivals forKey:@"festivals"];
    }
    if (course.length)
    {
        [request.params setObject:course forKey:@"course"];
    }
    if (clssids.length)
    {
        [request.params setObject:clssids forKey:@"clssids"];
    }
    
    [request.params setObject:[GFStaticData getObjectForKey:kTagUserKeyID] forKey:@"osperion"];
    
    [request start];
}

@end
