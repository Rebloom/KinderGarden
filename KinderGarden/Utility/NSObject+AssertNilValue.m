//
//  NSObject+AssertNilValue.m
//  KinderGarden
//
//  Created by Rebloom on 16/8/14.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "NSObject+AssertNilValue.h"

@implementation NSObject (AssertNilValue)

+ (BOOL)swizzing_method:(SEL)originalSelector  replaceMethod:(SEL)replaceSelector
{
    Method original = class_getInstanceMethod(self, originalSelector);
    Method replace = class_getInstanceMethod(self, replaceSelector);
    if (!original || !replace) {
        return NO;
    }
    class_addMethod(self, originalSelector, class_getMethodImplementation(self, originalSelector), method_getTypeEncoding(original));
    class_addMethod(self, replaceSelector, class_getMethodImplementation(self, replaceSelector), method_getTypeEncoding(replace));
    
    method_exchangeImplementations(original, replace);
    return YES;
}

+ (BOOL)swizzingClassMethod:(SEL)originSelector replaceMethod:(SEL)replaceSelector
{
    return [object_getClass((id)self) swizzing_method:originSelector replaceMethod:replaceSelector];
}


@end
