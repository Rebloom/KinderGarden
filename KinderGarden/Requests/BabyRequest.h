//
//  BabyRequest.h
//  KinderGarden
//
//  Created by haonanchen on 16/9/27.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "NXBaseRequest.h"

// 添加宝宝记录
#define kRequestTagInsertBabyInfo       @"babyinfo/save?"
// 获取宝宝列表
#define kRequestTagGetBabyList          @"babyinfo/babyinfoList?"
// 请假
#define kRequestTagBabyRequestLeave     @"babyAskforLeave/save?"
// 宝宝成长记录发布
#define kRequestTagSaveBabyGrouth       @"babyGrowthRecord/save?"

@interface BabyRequest : NXBaseRequest

+ (void)requestBabyListWithPage:(NSInteger)page rows:(NSInteger)row delegate:(id)_delegate;

+ (void)requestLeaveWithBabyID:(NSString *)babyID asktype:(NSString *)askType askday:(NSInteger)askday asktext:(NSString *)asktext delegate:(id)_delegate;

+ (void)insertBabyInfoWithAge:(NSInteger)age bgUrl:(NSString *)bgUrl birthday:(NSString *)birthday iconUrl:(NSString *)iconUrl schoolTime:(NSString *)schoolTime inSchool:(NSString *)inSchool nickName:(NSString *)nickName sex:(NSString *)sex username:(NSString *)userName delegate:(id)_delegate;

+ (void)publicBabyGrouthWithBabyID:(NSString *)babyID publisherName:(NSString *)publisherName content:(NSString *)content imageUrl:(NSString *)publishImage delegate:(id)_delegate;

@end
