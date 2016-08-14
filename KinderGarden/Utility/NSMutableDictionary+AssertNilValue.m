//
//  NSMutableDictionary+AssertNilValue.m
//  KinderGarden
//
//  Created by Rebloom on 16/8/14.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "NSMutableDictionary+AssertNilValue.h"

@implementation NSMutableDictionary (AssertNilValue)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        [self swizzingClassMethod:@selector(setObject:forKey:) replaceMethod:@selector(zpSwizzing__setObject:forKey:)];
        
        [self swizzingClassMethod:@selector(initWithObjects:forKeys:count:) replaceMethod:@selector(zpSwizzing_initWithObjects:forKeys:count:)];
        [self swizzingClassMethod:@selector(dictionaryWithObjects:forKeys:count:) replaceMethod:@selector(zpSwizzingClass_dictionaryWithObjects:forKeys:count:)];
    });
}

- (void)zpSwizzing__setObject:(nullable id)object forKey:(nullable NSString *)key
{
    if (object == nil || [object isEqual:[NSNull null]] || [object isEqualToString:@"<NSNull>"])
    {
        return;
    }
    [self setObject:object forKey:key];
}

- (instancetype)zpSwizzing_initWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt{
    id safeObjects[cnt];
    id safeKeys[cnt];
    
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt ; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key || !obj) {
            continue;
        }
        safeObjects[j] = obj;
        safeKeys[j] = key;
        j++;
    }
    return  [self zpSwizzing_initWithObjects:safeObjects forKeys:safeKeys count:j];
}


+ (instancetype)zpSwizzingClass_dictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt
{
    id safeObjects[cnt];
    id safeKeys[cnt];
    
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt ; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key || !obj) {
            continue;
        }
        safeObjects[j] = obj;
        safeKeys[j] = key;
        j++;
    }
    return [self zpSwizzingClass_dictionaryWithObjects:safeObjects forKeys:safeKeys count:j];
}

+ (instancetype)dictionaryWithObjects:(const id[])objects forKeys:(const id[])keys count:(NSUInteger)cnt
{
    NSMutableArray *validKeys = [NSMutableArray new];
    NSMutableArray *validObjs = [NSMutableArray new];
    
    for (NSUInteger i = 0; i < cnt; i ++) {
        if (objects[i] && keys[i])
        {
            [validKeys addObject:keys[i]];
            [validObjs addObject:objects[i]];
        }
    }
    
    return [self dictionaryWithObjects:validObjs forKeys:validKeys];
}

@end
