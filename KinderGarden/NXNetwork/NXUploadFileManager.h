//
//  NXUploadFileManager.h
//  OAConnectStore
//
//  Created by haonanchen on 16/5/20.
//  Copyright © 2016年 zengxiangrong. All rights reserved.
//


#import <Foundation/Foundation.h>

#import "QiniuSDK.h"


@protocol UploadFileDelegate <NSObject>

- (void)uploadFileSuccess:(NSDictionary *)back;

- (void)uploadFileFailed:(NSError *)error;

@end

@interface NXUploadFileManager : NSObject

@property (nonatomic, strong) AFURLSessionManager * sessionManager;
@property (nonatomic, weak) id <UploadFileDelegate> delegate;

+ (NXUploadFileManager *)sharedManager;

- (void)uploadImage:(UIImage *)image delegate:(id)delegate;

- (void)uploadImage:(UIImage *)image delegate:(id)delegate isChat:(NSInteger)isChat source:(NSString *)source;

- (void)uploadImages:(NSArray *)imageArray delegate:(id)delegate;

- (void)uploadImages:(NSArray *)imageArray delegate:(id)delegate source:(NSString *)source;

- (void)uploadAudioData:(NSData *)audioData delegate:(id)delegate;

@end
