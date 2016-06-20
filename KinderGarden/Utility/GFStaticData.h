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
@interface GFStaticData : NSObject

+ (GFStaticData *)defaultDataCenter;

+ (BOOL)saveObject:(id)object forKey:(NSString *)key;

+ (id)getObjectForKey:(NSString *)key;


@end
