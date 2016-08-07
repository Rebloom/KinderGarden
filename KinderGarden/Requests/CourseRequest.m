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

@end
