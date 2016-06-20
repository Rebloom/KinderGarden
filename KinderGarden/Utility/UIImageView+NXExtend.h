//
//  UIImageView+NXExtend.h
//  OAConnectStore
//
//  Created by haonanchen on 16/4/29.
//  Copyright © 2016年 zengxiangrong. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"

typedef enum _NXDefaultImageType
{
    NXDefaultImageTypeHeader = 0,
    NXDefaultImageTypeGround
}NXDefaultImageType;


@interface UIImageView (NXExtend)

- (void)nx_setImageWithUrl:(NSString *)urlString;

- (void)nx_setImageWithUrl:(NSString *)urlString placeHolder:(UIImage *)image;

- (void)nx_setImageWithUrl:(NSString *)urlString defaultType:(NXDefaultImageType)imageType;

- (void)nx_setImageWithUrl:(NSString *)urlString placeHolder:(UIImage *)image options:(SDWebImageOptions)options;

- (void)nx_setImageWithUrl:(NSString *)urlString placeHolder:(UIImage *)image completed:(SDWebImageCompletionBlock)block;

@end
