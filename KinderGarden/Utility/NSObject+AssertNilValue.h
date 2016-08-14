//
//  NSObject+AssertNilValue.h
//  KinderGarden
//
//  Created by Rebloom on 16/8/14.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>

@interface NSObject (AssertNilValue)

+ (BOOL)swizzing_method:(SEL)originalSelector  replaceMethod:(SEL)replaceSelector;

+ (BOOL)swizzingClassMethod:(SEL)originSelector replaceMethod:(SEL)replaceSelector;

@end
