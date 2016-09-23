//
//  NXUploadFileManager.m
//  OAConnectStore
//
//  Created by haonanchen on 16/5/20.
//  Copyright © 2016年 zengxiangrong. All rights reserved.
//

#import "NXUploadFileManager.h"

#import "NXNetworkConfig.h"

#import "AFNetworking.h"

#import "QiniuSDK.h"

@implementation NXUploadFileManager

+ (NXUploadFileManager *)sharedManager
{
    static NXUploadFileManager * sharedManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
}

- (void)configSessionManager
{
    if (self.sessionManager == nil)
    {
        self.sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        self.sessionManager.operationQueue.maxConcurrentOperationCount = 1;
        self.sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    }
    AFHTTPResponseSerializer * responseSerializer = [AFHTTPResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain" ,nil];
    self.sessionManager.responseSerializer = responseSerializer;
}


- (void)uploadImage:(UIImage *)image delegate:(id)delegate
{
    [self uploadImage:image delegate:delegate isChat:NO source:nil];
}

- (void)uploadImage:(UIImage *)image delegate:(id)delegate isChat:(NSInteger)isChat source:(NSString *)source
{
    self.delegate = delegate;
    [self configSessionManager];
    if (image)
    {

    }
}

- (void)uploadImages:(NSArray *)imageArray delegate:(id)delegate
{
    [self uploadImages:imageArray delegate:delegate source:nil];
}

- (void)uploadImages:(NSArray *)imageArray delegate:(id)delegate source:(NSString *)source
{
    self.delegate = delegate;
    [self configSessionManager];
    // 准备保存结果的数组，元素个数与上传的图片个数相同，先用 NSNull 占位
    NSMutableArray * result = [NSMutableArray array];
    for (int i = 0; i < imageArray.count; i++)
    {
        [result addObject:[NSNull null]];
    }
    // 创建请求组队列
    dispatch_group_t group = dispatch_group_create();
    for (int i = 0; i < imageArray.count; i++)
    {
        dispatch_group_enter(group);
        NSObject * object = [imageArray objectAtIndex:i];
        if ([object isKindOfClass:[UIImage class]])
        {
            UIImage * image = (UIImage *)object;
            QNUploadManager *upManager = [[QNUploadManager alloc] init];
            NSData *data = UIImagePNGRepresentation(image);
            NSString * fileName = [NSString stringWithFormat:@"%lf_%@",[[NSDate date ] timeIntervalSince1970],[[GFStaticData getObjectForKey:kTagUserKeyID] description].md5String];
            [upManager putData:data key:fileName token:[GFStaticData getObjectForKey:kTagQiniuSDKToken]
                      complete: ^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                          NSLog(@"%@", info);
                          NSLog(@"%@", resp);
                          if (info.error)
                          {
                              dispatch_group_leave(group);
                              if (self.delegate && [self.delegate respondsToSelector:@selector(uploadFileFailed:)])
                              {
                                  [self.delegate uploadFileFailed:info.error];
                              }
                          }
                          else
                          {
                              @synchronized (result) {
                                  if ([resp objectForKey:@"key"])
                                  {
                                      result[i] = [NSString stringWithFormat:@"%@/%@",QiniuBucketSpaceName,[resp objectForKey:@"key"]];
                                  }
                              }
                              dispatch_group_leave(group);
                          }
                      } option:nil];
        }
    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"批量上传图片完成");
        if (self.delegate && [self.delegate respondsToSelector:@selector(uploadFileSuccess:)])
        {
            if ([[result firstObject] isEqual:[NSNull null]])
            {
                [self.delegate uploadFileFailed:nil];
                return;
            }
            NSMutableDictionary * back = [NSMutableDictionary dictionary];
            [back setObject:[result componentsJoinedByString:@","] forKey:@"imageUrls"];
            [self.delegate uploadFileSuccess:back];
        }
    });
}

@end
