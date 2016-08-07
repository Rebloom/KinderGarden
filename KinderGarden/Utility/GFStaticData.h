//
//  GFStaticData.h
//  XDCY
//
//  Created by 孤星之殇 on 15/8/15.
//  Copyright (c) 2015年 孤星之殇. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Utility.h"

//保存用户信息
#define KTagUserAuth        @"KTagUserAuth"

#define kTagUserKeyWelcomed @"kTagUserKeyWelcomed"
#define kTagUserKeyToken    @"kTagUserKeyToken"


// 用户手机号
#define kTagUserPhone                   @"kTagUserPhone"
// 用户id
#define kTagUserKeyID                   @"kTagUserKeyID"

@interface GFStaticData : NSObject

+ (GFStaticData *)defaultDataCenter;

+ (BOOL)saveObject:(id)object forKey:(NSString *)key;

+ (id)getObjectForKey:(NSString *)key;


@end
