//
//  BabyRequest.h
//  KinderGarden
//
//  Created by haonanchen on 16/9/27.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "NXBaseRequest.h"

// 获取宝宝列表
#define GetBabyList         @"babyinfo/babyinfoList?"

@interface BabyRequest : NXBaseRequest

+ (void)requestBabyListWithPage:(NSInteger)page rows:(NSInteger)row delegate:(id)_delegate;

@end
