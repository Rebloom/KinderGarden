//
//  GFStaticData.m
//  XDCY
//
//  Created by 孤星之殇 on 15/8/15.
//  Copyright (c) 2015年 孤星之殇. All rights reserved.
//

#import "GFStaticData.h"

@implementation GFStaticData

static GFStaticData * gfStaticData = nil;

+ (GFStaticData *)defaultDataCenter
{
    if (!gfStaticData)
    {
        gfStaticData = [[GFStaticData alloc] init];
    }
    return gfStaticData;
}

+ (BOOL)saveObject:(id)object forKey:(NSString *)key
{
    if (!object && key)
    {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
    else if (key)
    {
        [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    }
    else
    {
        assert(object);
    }
    return [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)getObjectForKey:(NSString *)key
{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:key])
    {
        return [[NSUserDefaults standardUserDefaults] objectForKey:key];
    }
    else
    {
        return nil;
    }
}
@end