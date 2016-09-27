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
    request.vrCodeString = GetBabyList;
    request.delegate = _delegate;
    
    [request.params setObject:[NSString stringWithFormat:@"%@",@(page)] forKey:@"page"];
    [request.params setObject:[NSString stringWithFormat:@"%@",@(row)] forKey:@"rows"];
    
    [request start];
}

@end
