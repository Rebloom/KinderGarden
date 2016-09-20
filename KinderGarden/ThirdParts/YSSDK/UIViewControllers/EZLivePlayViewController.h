//
//  EZLivePlayViewController.h
//  EZOpenSDKDemo
//
//  Created by DeJohn Dong on 15/10/28.
//  Copyright © 2015年 hikvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZLivePlayViewController : UIViewController

@property (nonatomic, copy) NSString *cameraId;
@property (nonatomic, copy) NSString *cameraName;
@property (nonatomic, copy) NSString *deviceSerial;
@property (nonatomic, copy) NSString *url;

- (void)imageSavedToPhotosAlbum:(UIImage *)image
       didFinishSavingWithError:(NSError *)error
                    contextInfo:(void *)contextInfo;

@end
