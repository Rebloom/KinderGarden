//
//  BabyRequest.m
//  KinderGarden
//
//  Created by haonanchen on 16/9/27.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "BabyRequest.h"

@implementation BabyRequest

+ (void)requestBabyListWithPage:(NSInteger)page rows:(NSInteger)row delegate:(id)_delegate
{
    BabyRequest * request = [[BabyRequest alloc] init];
    request.vrCodeString = kRequestTagGetBabyList;
    request.delegate = _delegate;
    
    [request.params setObject:[NSString stringWithFormat:@"%@",@(page)] forKey:@"page"];
    [request.params setObject:[NSString stringWithFormat:@"%@",@(row)] forKey:@"rows"];
    
    [request start];
}

+ (void)requestLeaveWithBabyID:(NSString *)babyID asktype:(NSString *)askType askday:(NSInteger)askday asktext:(NSString *)asktext delegate:(id)_delegate
{
    BabyRequest * request = [[BabyRequest alloc] init];
    request.vrCodeString = kRequestTagBabyRequestLeave;
    request.delegate = _delegate;
    
    [request.params setObject:[NSNumber numberWithString:babyID] forKey:@"babyid"];
    [request.params setObject:askType forKey:@"asktype"];
    [request.params setObject:[NSNumber numberWithInteger:askday] forKey:@"askday"];
    [request.params setObject:asktext forKey:@"asktext"];
    
    [request start];
}

+ (void)insertBabyInfoWithAge:(NSInteger)age bgUrl:(NSString *)bgUrl birthday:(NSString *)birthday iconUrl:(NSString *)iconUrl schoolTime:(NSString *)schoolTime inSchool:(NSString *)inSchool nickName:(NSString *)nickName sex:(NSString *)sex username:(NSString *)userName delegate:(id)_delegate
{
    BabyRequest * request = [[BabyRequest alloc] init];
    request.vrCodeString = kRequestTagInsertBabyInfo;
    request.delegate = _delegate;
    
    [request.params setObject:[NSNumber numberWithInteger:age] forKey:@"age"];
    [request.params setObject:bgUrl forKey:@"bgurl"];
    [request.params setObject:birthday forKey:@"bobybirthdate"];
    [request.params setObject:iconUrl forKey:@"iocurl"];
    [request.params setObject:schoolTime forKey:@"bobyenrollmentdate"];
    [request.params setObject:inSchool forKey:@"isshool"];
    [request.params setObject:nickName forKey:@"nickname"];
    [request.params setObject:[GFStaticData getObjectForKey:kTagUserKeyID] forKey:@"ostmpid"];
    [request.params setObject:sex forKey:@"sex"];
    [request.params setObject:userName forKey:@"username"];
    
    [request start];
}

+ (void)publicBabyGrouthWithBabyID:(NSString *)babyID publisherName:(NSString *)publisherName content:(NSString *)content imageUrl:(NSString *)publishImage delegate:(id)_delegate
{
    BabyRequest * request = [[BabyRequest alloc] init];
    request.vrCodeString = kRequestTagSaveBabyGrouth;
    request.delegate = _delegate;
    
    [request.params setObject:babyID?babyID:@"" forKey:@"babyid"];
    [request.params setObject:[GFStaticData getObjectForKey:kTagUserKeyID] forKey:@"publisher"];
    [request.params setObject:publisherName forKey:@"publishername"];
    [request.params setObject:content forKey:@"publishertext"];
    [request.params setObject:[NSDate date] forKey:@"bobypublisherdate"];
    [request.params setObject:publishImage forKey:@"publisherimge"];
    
    [request start];
}

@end
