//
//  NSMutableDictionary+AssertNilValue.h
//  KinderGarden
//
//  Created by Rebloom on 16/8/14.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSObject+AssertNilValue.h"

@interface NSMutableDictionary (AssertNilValue)

+ (void)load;

- (void)nx_setObject:(nullable id)object forKey:(nullable NSString *)key;

+ (instancetype)dictionaryWithObjects:(const id[])objects forKeys:(const id[])keys count:(NSUInteger)cnt;

@end
