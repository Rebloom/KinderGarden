//
//  UIImageView+NXExtend.m
//  OAConnectStore
//
//  Created by haonanchen on 16/4/29.
//  Copyright © 2016年 zengxiangrong. All rights reserved.
//

#import "UIImageView+NXExtend.h"


@implementation UIImageView (NXExtend)

- (void)nx_setImageWithUrl:(NSString *)urlString
{
    [self nx_setImageWithUrl:urlString defaultType:NXDefaultImageTypeHeader];
}

- (void)nx_setImageWithUrl:(NSString *)urlString placeHolder:(UIImage *)image
{
    [self sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:image];
}

- (void)nx_setImageWithUrl:(NSString *)urlString defaultType:(NXDefaultImageType)imageType
{
    if (imageType == NXDefaultImageTypeHeader)
    {
        [self sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:@"defaultHead"]];
    }
    else if (imageType == NXDefaultImageTypeGround)
    {
        [self sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:@"imageDefault"]];
    }
}

- (void)nx_setImageWithUrl:(NSString *)urlString placeHolder:(UIImage *)image options:(SDWebImageOptions)options
{
    [self sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:image options:options];
}

- (void)nx_setImageWithUrl:(NSString *)urlString placeHolder:(UIImage *)image completed:(SDWebImageCompletionBlock)block
{
    [self sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:image completed:block];
}

@end
