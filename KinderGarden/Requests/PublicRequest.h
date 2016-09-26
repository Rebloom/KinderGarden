//
//  PublicRequest.h
//  KinderGarden
//
//  Created by Rebloom on 16/8/7.
//  Copyright © 2016年 haonanchen. All rights reserved.
//

#import "NXBaseRequest.h"

// 发布一条公告信息
#define kTagPublishPublicRequest        @"announcement/save?"

// 查询公告列表
#define kTagGetPublicListRequest        @"announcement/announcementList?"

// 保存公告的评论
#define kTagCommentPublicRequest        @"announcementComment/save?"

// 所有公共文章转发
#define kTagShareArticleRequest         @"commonZfLog/save?"

// 所有点赞公共接口
#define kTagPraiseRequest               @"commonDzLog/save?"

// 发布一条食谱
#define kTagAddOneFoodRequest           @"food/save?"

// 父母圈发帖
#define kTagParrentPublishRequest       @"parentTopic/save?"

// 请求七牛token
#define kTagRequestQNToken              @"jgkj/getQiniuToken?"

@interface PublicRequest : NXBaseRequest

+ (void)publishPublicInfoWithTitle:(NSString *)title bannerImage:(NSString *)bannerImage content:(NSString *)announcement range:(NSString *)selectrange images:(NSString *)imageUrl videoUrl:(NSString *)videoUrl operatePersonID:(NSString *)personID delegate:(id)_delegate;

+ (void)getPublicListWithPage:(NSString *)page numbers:(NSString *)rows delegate:(id)_delegate;

+ (void)savePublicInfoComment:(NSString *)publicID commentPerson:(NSString *)commentID isShow:(BOOL)show commentContent:(NSString *)commentContent delegate:(id)_delegate;

+ (void)shareArticleWithArticleID:(NSString *)articleID operateID:(NSString *)personID role:(NSString *)role shareType:(NSString *)type sourceType:(NSString *)sourceType delegate:(id)_delegate;\

+ (void)praiseWithOurID:(NSString *)outID operateID:(NSString *)personID praiseType:(NSString *)type delegate:(id)_delegate;

+ (void)getQiniuTokenWithImageName:(NSString *)name delegate:(id)_delegate;

+ (void)addFoodRequestWithWeekNumber:(NSString *)weekNumber meal:(NSString *)meal foodImages:(NSMutableArray *)foodImages foodDesc:(NSString *)fooddesc classID:(NSString *)classID schoolID:(NSString *)schoolID operateID:(NSString *)personID delegate:(id)_delegate;

+ (void)addParentPublishWithSchoolID:(NSString *)schoolID address:(NSString *)address topic:(NSString *)topic content:(NSString *)content topicImage:(NSString *)topicImage type:(NSString *)type delegate:(id)_delegate;

@end
