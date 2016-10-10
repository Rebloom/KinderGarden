//
//  ThirdPartRequest.h
//  KinderGarden
//
//  Created by haonanchen on 16/10/10.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "NXBaseRequest.h"

@interface ThirdPartRequest : NXBaseRequest

+ (void)requestYingShiAccessTokenWithDelegate:(id)_delegate;

@end
