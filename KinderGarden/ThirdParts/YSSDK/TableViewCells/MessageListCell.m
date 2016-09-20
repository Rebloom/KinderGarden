//
//  MessageListCell.m
//  EZOpenSDKDemo
//
//  Created by DeJohn Dong on 15/11/3.
//  Copyright © 2015年 hikvision. All rights reserved.
//

#import "MessageListCell.h"
#import "UIImageView+EzvizOpenSDK.h"
#import "UIImageView+AFNetworking.h"
#import "EZOpenSDK.h"
#import "DDKit.h"
#import "GlobalKit.h"

@implementation MessageListCell

- (void)awakeFromNib {
    // Initialization code
    self.readStatusIcon.layer.cornerRadius = 5.0f;
    self.readStatusIcon.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state    
    self.readStatusIcon.backgroundColor = [UIColor dd_hexStringToColor:@"0x1b9ee2"];
}

- (void)setAlarmInfo:(EZAlarmInfo *)info
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm:ss";
    self.timeLabel.text = [formatter stringFromDate:info.alarmStartTime];
    self.readStatusIcon.hidden = NO;
    if(info.isRead)
    {
        self.readStatusIcon.hidden = YES;
    }
    
    /*有2种图片链接
     https://whpic.ys7.com:8009/HIK_1447836214_458BEBDAE4AB6a6f_525400286893421023815?isEncrypted=1&isCloudStored=0
     https://www.ys7.com:9090/api/cloud?method=download&fid=5ed92258-8e0f-11e5-8000-c19249a52dcf&deviceSerialNo=504242549&isEncrypted=0&isCloudStored=1
     */
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@&session=%@",info.alarmPicUrl,[GlobalKit shareKit].accessToken]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    __weak typeof(self) weakSelf = self;
    BOOL isEncrypt = NO;
    NSRange range = [info.alarmPicUrl rangeOfString:@"isEncrypted="];
    if(range.location != NSNotFound)
    {
        isEncrypt = [[info.alarmPicUrl substringWithRange:NSMakeRange(range.location + range.length, 1)] boolValue];
    }
    [self.actionImageView ez_setImageWithURLRequest:request
                                   placeholderImage:[UIImage imageNamed:@"message_callhelp"]
                                            success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSData * _Nonnull data) {
                                                if (!isEncrypt) {
                                                    weakSelf.actionImageView.image = [[UIImage alloc] initWithData:data];
                                                }else{
                                                    NSData *decodeData = [EZOpenSDK decryptData:data password:[EZOpenSDK getValidteCode:weakSelf.deviceSerial]];
                                                    weakSelf.actionImageView.image = [[UIImage alloc] initWithData:decodeData];
                                                }
                                                if(weakSelf.actionImageView.image == nil)
                                                {
                                                    weakSelf.actionImageView.image = [UIImage imageNamed:@"message_callhelp"];
                                                }
                                            }
                                            failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
                                                NSLog(@"error = %@",error);
                                            }];
    self.descriptionLabel.text = [NSString stringWithFormat:@"来自:%@", info.alarmName];
}

@end
